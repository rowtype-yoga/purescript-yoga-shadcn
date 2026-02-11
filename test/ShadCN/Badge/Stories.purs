module ShadCN.Badge.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import ShadCN.Badge as Badge
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story) as S

data Variant = Default | Secondary | Destructive | Outline

derive instance Generic Variant _

mkBadge :: { variant :: Variant } -> JSX
mkBadge = component "BadgeStory" \props -> React.do
  pure $ div { className: "flex flex-col gap-4" }
    [ p { className: "text-muted-foreground text-sm" } (text "Displays a badge or a component that looks like a badge.")
    , case props.variant of
        Default -> Badge.badgeDefault "Badge"
        Secondary -> Badge.badgeSecondary "Secondary"
        Destructive -> Badge.badgeDestructive "Destructive"
        Outline -> Badge.badgeOutline "Outline"
    ]

default :: JSX
default = S.story "default" mkBadge
  { variant: enum Default }
