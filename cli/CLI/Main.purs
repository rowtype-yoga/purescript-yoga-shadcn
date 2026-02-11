module CLI.Main where

import Prelude

import CLI.GitHub as GitHub
import CLI.Install as Install
import CLI.Registry as Registry
import Data.Array as Array
import Data.Either (Either(..))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Foldable (for_)
import Data.String as String
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Effect.Exception as Exception
import Foreign.Object as Object
import Node.Process as Process
import Yoga.Om (Om, runOm)

main :: Effect Unit
main = do
  args <- Process.argv
  let cliArgs = Array.drop 2 args
  case Array.uncons cliArgs of
    Just { head: "list" } -> runCli listCmd
    Just { head: "add", tail } | not (Array.null tail) -> runCli (addCmd tail)
    _ -> printUsage

runCli :: Om {} () Unit -> Effect Unit
runCli om = launchAff_ do
  runOm {}
    { exception: \err -> do
        Console.error $ "Error: " <> Exception.message err
        liftEffect $ Process.exit' 1
    }
    om

listCmd :: forall ctx. Om ctx () Unit
listCmd = do
  Console.log "Fetching registry..."
  registry <- GitHub.fetchRegistry
  Console.log ""
  Console.log "Available components:"
  Console.log ""
  for_ (Registry.listComponents registry) \name -> do
    let deps = Object.lookup name registry # map _.npmDeps # fromMaybe []
    let suffix = if Array.null deps then "" else " (" <> String.joinWith ", " deps <> ")"
    Console.log $ "  " <> name <> suffix
  Console.log ""
  Console.log $ show (Array.length (Registry.listComponents registry)) <> " components"

addCmd :: forall ctx. Array String -> Om ctx () Unit
addCmd names = do
  Console.log "Fetching registry..."
  registry <- GitHub.fetchRegistry
  case Registry.resolve names registry of
    Left unknown -> Console.error $ "Unknown component: " <> unknown
    Right resolved -> do
      Install.mkdirRecursive "src/ShadCN"
      installFiles resolved.files
      Install.installNpmDeps resolved.npmDeps
      Console.log ""
      Console.log "Make sure your spago.yaml includes these dependencies:"
      Console.log "  - react-basic"
      Console.log "  - react-basic-hooks"
      Console.log "  - react-basic-dom"
      Console.log "  - yoga-react"
      Console.log "  - yoga-react-dom"
  where
  installFiles files =
    for_ files \file -> do
      content <- GitHub.fetchFile ("src/ShadCN/" <> file)
      result <- Install.writeFile ("src/ShadCN/" <> file) content
      if result.written then Console.log $ "  Copied: src/ShadCN/" <> file
      else Console.log $ "  Exists: src/ShadCN/" <> file

printUsage :: Effect Unit
printUsage = do
  Console.log "yoga-shadcn - PureScript bindings for shadcn/ui"
  Console.log ""
  Console.log "Usage:"
  Console.log "  yoga-shadcn add <component...>"
  Console.log "  yoga-shadcn list"
