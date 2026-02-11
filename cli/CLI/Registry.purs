module CLI.Registry where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Set as Set
import Data.String as String
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object (Object)
import Foreign.Object as Object

type RegistryEntry =
  { files :: Array String
  , npmDeps :: Array String
  , componentDeps :: Array String
  }

type Registry = Object RegistryEntry

type Resolved =
  { files :: Array String
  , npmDeps :: Array String
  }

resolve :: Array String -> Registry -> Either String Resolved
resolve names registry = go names Set.empty ([] /\ [])
  where
  go :: Array String -> Set.Set String -> Array String /\ Array String -> Either String Resolved
  go pending seen (files /\ deps) = case Array.uncons pending of
    Nothing -> Right { files: Array.nub files, npmDeps: Array.nub deps }
    Just { head: name, tail } ->
      if Set.member name seen then go tail seen (files /\ deps)
      else case Object.lookup name registry of
        Nothing -> Left name
        Just entry -> do
          let seen' = Set.insert name seen
          go (tail <> entry.componentDeps) seen' ((files <> entry.files) /\ (deps <> entry.npmDeps))

listComponents :: Registry -> Array String
listComponents = Object.keys >>> Array.filter (not <<< isInternal) >>> Array.sort
  where
  isInternal name = case String.stripPrefix (String.Pattern "_") name of
    Just _ -> true
    Nothing -> false
