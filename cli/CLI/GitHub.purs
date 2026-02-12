module CLI.GitHub where

import Prelude

import CLI.Registry (Registry)
import Data.Either (Either(..))
import Data.Foldable (fold)
import Effect.Exception (throw) as Exception
import Node.Encoding (Encoding(..))
import Node.FS.Sync as FS
import Yoga.Fetch.Om (GET, Route, PlainText, Streaming, type (/), type (:), client, plainText)
import Yoga.JSON as JSON
import Yoga.Om (class ToOm, Om, toOm)
import Yoga.Om.Strom (Strom)
import Yoga.Om.Strom as Strom

type GitHubAPI =
  { getRegistry ::
      Route GET ("cli" / "registry.json") {}
        (ok :: { body :: Registry })
  , getFile ::
      Route GET ("src" / "ShadCN" / "filename" : String) {}
        (ok :: { body :: PlainText })
  , streamFile ::
      Route GET ("src" / "ShadCN" / "filename" : String) {}
        (ok :: { body :: Streaming String })
  }

baseUrl :: String
baseUrl = "https://raw.githubusercontent.com/rowtype-yoga/purescript-yoga-shadcn/main"

github
  :: forall ctx err
   . { getRegistry :: Om ctx err Registry
     , getFile :: { filename :: String } -> Om ctx err PlainText
     , streamFile :: { filename :: String } -> Om ctx err (Strom {} () String)
     }
github = client @GitHubAPI baseUrl

fetchFile :: forall ctx err. String -> Om ctx err String
fetchFile filename = do
  let localPath = "src/ShadCN/" <> filename
  localExists <- FS.exists localPath # toOm
  if localExists then FS.readTextFile UTF8 localPath # toOm
  else plainText <$> github.getFile { filename }

fetchFileStreaming :: String -> Om {} () String
fetchFileStreaming filename = do
  let localPath = "src/ShadCN/" <> filename
  localExists <- FS.exists localPath # toOm
  if localExists then FS.readTextFile UTF8 localPath # toOm
  else do
    strom <- github.streamFile { filename }
    chunks <- Strom.runCollect strom
    pure $ fold chunks

fetchRegistry :: forall ctx err. Om ctx err Registry
fetchRegistry = do
  localExists <- FS.exists "cli/registry.json" # toOm
  if localExists then do
    text <- FS.readTextFile UTF8 "cli/registry.json" # toOm
    case JSON.readJSON text of
      Right registry -> pure registry
      Left err -> Exception.throw ("Failed to parse registry: " <> show err) # toOm
  else
    github.getRegistry
