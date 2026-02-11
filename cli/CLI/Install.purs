module CLI.Install where

import Prelude

import Data.Array as Array
import Data.String as String
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Node.ChildProcess as CP
import Node.Encoding (Encoding(..))
import Node.FS.Perms (mkPerms, all)
import Node.FS.Sync as FS
import Yoga.Om (Om)

writeFile :: forall ctx err. String -> String -> Om ctx err { written :: Boolean }
writeFile path content = liftEffect do
  alreadyExists <- FS.exists path
  if alreadyExists then pure { written: false }
  else do
    FS.writeTextFile UTF8 path content
    pure { written: true }

mkdirRecursive :: forall ctx err. String -> Om ctx err Unit
mkdirRecursive path = liftEffect do
  FS.mkdir' path { recursive: true, mode: mkPerms all all all }

installNpmDeps :: forall ctx err. Array String -> Om ctx err Unit
installNpmDeps deps =
  when (not (Array.null deps)) do
    let cmd = "bun add " <> String.joinWith " " deps
    Console.log $ "Installing: " <> String.joinWith ", " deps
    _ <- liftEffect $ CP.execSync cmd
    pure unit
