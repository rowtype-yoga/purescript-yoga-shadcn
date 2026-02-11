module ShadCN.Badge.Stories (default) where

import Prelude

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import ShadCN.Badge as Badge
import Yoga.React (component)
import YogaStories.Controls (enum)
import YogaStories.Story (story) as S

data Variant = Default | Secondary | Destructive | Outline

derive instance Generic Variant _

mkBadge :: { label :: String, variant :: Variant } -> JSX
mkBadge = component "BadgeStory" \props -> React.do
  let
    badge = case props.variant of
      Default -> Badge.badgeDefault
      Secondary -> Badge.badgeSecondary
      Destructive -> Badge.badgeDestructive
      Outline -> Badge.badgeOutline
  pure $ badge $ props.label

default :: JSX
default = S.story "default" mkBadge
  { label: "Badge"
  , variant: enum Default
  }
