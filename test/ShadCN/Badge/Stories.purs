module ShadCN.Badge.Stories (primary, destructive) where

import Prelude

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import ShadCN.Badge as Badge
import Yoga.React (component)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

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

primary :: JSX
primary = story "primary" mkBadge
  { label: "Badge"
  , variant: enum Default
  }

destructive :: JSX
destructive = story "destructive" mkBadge
  { label: "Error"
  , variant: enum Destructive
  }
