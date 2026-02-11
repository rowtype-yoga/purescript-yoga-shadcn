module CLI.GitHub where

import Prelude

import CLI.Registry (Registry)
import Data.Either (Either(..))
import Effect.Class (liftEffect)
import Effect.Exception (throw) as Exception
import JS.Fetch as Fetch
import JS.Fetch.Request as Request
import JS.Fetch.Response as Response
import Node.Encoding (Encoding(..))
import Node.FS.Sync as FS
import Promise.Aff as Promise
import Yoga.JSON (readJSON)
import Yoga.Om (Om, fromAff)

baseUrl :: String
baseUrl = "https://raw.githubusercontent.com/rowtype-yoga/purescript-yoga-shadcn/main"

fetchText :: forall ctx err. String -> Om ctx err String
fetchText url = fromAff do
  req <- liftEffect $ Request.new url {}
  resp <- Promise.toAffE (Fetch.fetch req)
  let status = Response.status resp
  when (status /= 200) do
    liftEffect $ Exception.throw ("HTTP " <> show status <> ": " <> url)
  Promise.toAffE (Response.text resp)

fetchFile :: forall ctx err. String -> Om ctx err String
fetchFile path = do
  localExists <- liftEffect (FS.exists path)
  if localExists then liftEffect (FS.readTextFile UTF8 path)
  else fetchText (baseUrl <> "/" <> path)

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
    else fetchText (baseUrl <> "/cli/registry.json")
