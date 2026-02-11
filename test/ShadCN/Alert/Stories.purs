module ShadCN.Alert.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import ShadCN.Alert (alert, alertDestructive, alertDescription, alertTitle)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story) as S

data Variant = Default | Destructive

derive instance Generic Variant _

mkAlert :: { variant :: Variant } -> JSX
mkAlert = component "AlertStory" \props -> React.do
  pure $ div { className: "flex flex-col gap-4" }
    [ p { className: "text-muted-foreground text-sm" } (text "Displays a callout for user attention.")
    , case props.variant of
        Default -> alert
          [ alertTitle "Heads up!"
          , alertDescription "You can add components to your app using the CLI."
          ]
        Destructive -> alertDestructive
          [ alertTitle "Error"
          , alertDescription "Your session has expired. Please log in again."
          ]
    ]

default :: JSX
default = S.story "default" mkAlert
  { variant: enum Default }
