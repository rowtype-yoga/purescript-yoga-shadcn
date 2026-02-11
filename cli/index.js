#!/usr/bin/env node
import { readFileSync, copyFileSync, mkdirSync, existsSync } from "fs";
import { join, dirname } from "path";
import { execSync } from "child_process";
import { fileURLToPath } from "url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const registry = JSON.parse(
  readFileSync(join(__dirname, "registry.json"), "utf-8")
);
const srcDir = join(__dirname, "..", "src", "ShadCN");

function resolve(name, seen = new Set()) {
  if (seen.has(name)) return { files: [], npmDeps: [] };
  seen.add(name);
  const entry = registry[name];
  if (!entry) {
    console.error(`Unknown component: ${name}`);
    process.exit(1);
  }
  let files = [...entry.files];
  let npmDeps = [...entry.npmDeps];
  for (const dep of entry.componentDeps) {
    const resolved = resolve(dep, seen);
    files.push(...resolved.files);
    npmDeps.push(...resolved.npmDeps);
  }
  return { files: [...new Set(files)], npmDeps: [...new Set(npmDeps)] };
}

function list() {
  const names = Object.keys(registry)
    .filter((k) => !k.startsWith("_"))
    .sort();
  console.log("Available components:\n");
  for (const name of names) {
    const entry = registry[name];
    const deps = entry.npmDeps.length ? ` (${entry.npmDeps.join(", ")})` : "";
    console.log(`  ${name}${deps}`);
  }
  console.log(`\n${names.length} components`);
}

function add(names) {
  const allFiles = [];
  const allNpmDeps = [];

  for (const name of names) {
    const { files, npmDeps } = resolve(name);
    allFiles.push(...files);
    allNpmDeps.push(...npmDeps);
  }

  const uniqueFiles = [...new Set(allFiles)];
  const uniqueDeps = [...new Set(allNpmDeps)];

  const destDir = join(process.cwd(), "src", "ShadCN");
  mkdirSync(destDir, { recursive: true });

  const copied = [];
  const skipped = [];
  for (const file of uniqueFiles) {
    const src = join(srcDir, file);
    const dest = join(destDir, file);
    if (existsSync(dest)) {
      skipped.push(file);
    } else {
      copyFileSync(src, dest);
      copied.push(file);
    }
  }

  if (copied.length) {
    console.log("Copied:");
    for (const f of copied) console.log(`  src/ShadCN/${f}`);
  }
  if (skipped.length) {
    console.log("Already exists (skipped):");
    for (const f of skipped) console.log(`  src/ShadCN/${f}`);
  }

  if (uniqueDeps.length) {
    console.log(`\nInstalling: ${uniqueDeps.join(", ")}`);
    execSync(`bun add ${uniqueDeps.join(" ")}`, { stdio: "inherit" });
  }

  console.log(
    "\nMake sure your spago.yaml includes these dependencies:"
  );
  console.log("  - react-basic");
  console.log("  - react-basic-hooks");
  console.log("  - react-basic-dom");
  console.log("  - yoga-react");
  console.log("  - yoga-react-dom");
}

const [cmd, ...args] = process.argv.slice(2);

if (cmd === "list") {
  list();
} else if (cmd === "add" && args.length > 0) {
  add(args);
} else {
  console.log("Usage:");
  console.log("  yoga-shadcn add <component...>");
  console.log("  yoga-shadcn list");
}
