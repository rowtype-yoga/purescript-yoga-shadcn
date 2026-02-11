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

mkBadge :: { variant :: Variant } -> JSX
mkBadge = component "BadgeStory" \props -> React.do
  pure $ case props.variant of
    Default -> Badge.badgeDefault "Badge"
    Secondary -> Badge.badgeSecondary "Secondary"
    Destructive -> Badge.badgeDestructive "Destructive"
    Outline -> Badge.badgeOutline "Outline"

default :: JSX
default = S.story "default" mkBadge
  { variant: enum Default }
