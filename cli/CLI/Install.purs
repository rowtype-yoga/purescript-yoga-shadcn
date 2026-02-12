module CLI.Install where

import Prelude

import Data.Array as Array
import Data.String as String
import Effect.Class.Console as Console
import Node.ChildProcess as CP
import Node.Encoding (Encoding(..))
import Node.FS.Perms (mkPerms, all)
import Node.FS.Sync as FS
import Yoga.Om (class ToOm, Om, toOm)

writeFile :: forall ctx err. String -> String -> Om ctx err { written :: Boolean }
writeFile path content = do
  alreadyExists <- FS.exists path # toOm
  if alreadyExists then pure { written: false }
  else do
    FS.writeTextFile UTF8 path content # toOm
    pure { written: true }

mkdirRecursive :: forall ctx err. String -> Om ctx err Unit
mkdirRecursive path =
  FS.mkdir' path { recursive: true, mode: mkPerms all all all } # toOm

installNpmDeps :: forall ctx err. Array String -> Om ctx err Unit
installNpmDeps deps =
  when (not (Array.null deps)) do
    let cmd = "bun add " <> String.joinWith " " deps
    Console.log $ "Installing: " <> String.joinWith ", " deps
    CP.execSync cmd # void # toOm
