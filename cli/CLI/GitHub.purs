module CLI.GitHub where

import Prelude

import CLI.Registry (Registry)
import Data.Either (Either(..))
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Exception (throw) as Exception
import Node.Encoding (Encoding(..))
import Node.FS.Sync as FS
import Promise (Promise)
import Promise.Aff (toAffE)
import Yoga.JSON (readJSON)
import Yoga.Om (Om, fromAff)

baseUrl :: String
baseUrl = "https://raw.githubusercontent.com/rowtype-yoga/purescript-yoga-shadcn/main"

foreign import fetchTextImpl :: String -> Effect (Promise String)

fetchFile :: forall ctx err. String -> Om ctx err String
fetchFile path = do
  localExists <- liftEffect (FS.exists path)
  if localExists then liftEffect (FS.readTextFile UTF8 path)
  else toAffE (fetchTextImpl (baseUrl <> "/" <> path)) # fromAff

fetchRegistry :: forall ctx err. Om ctx err Registry
fetchRegistry = do
  text <- readRegistryText
  case readJSON text of
    Right registry -> pure registry
    Left err -> liftEffect (Exception.throw ("Failed to parse registry: " <> show err))
  where
  readRegistryText = do
    localExists <- liftEffect (FS.exists "cli/registry.json")
    if localExists then liftEffect (FS.readTextFile UTF8 "cli/registry.json")
    else toAffE (fetchTextImpl (baseUrl <> "/cli/registry.json")) # fromAff
