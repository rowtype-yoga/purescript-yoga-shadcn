module ShadCN.Alert.Stories (info, error) where

import Prelude

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import ShadCN.Alert (alert, alertDestructive, alertDescription, alertTitle)
import Yoga.React (component)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story)

data Variant = Default | Destructive

derive instance Generic Variant _

mkAlert :: { title :: String, description :: String, variant :: Variant } -> JSX
mkAlert = component "AlertStory" \props -> React.do
  let
    wrapper = case props.variant of
      Default -> alert
      Destructive -> alertDestructive
  pure $ wrapper
    [ alertTitle $ props.title
    , alertDescription props.description
    ]

info :: JSX
info = story "info" mkAlert
  { title: "Heads up!"
  , description: "You can add components to your app using the CLI."
  , variant: enum Default
  }

error :: JSX
error = story "error" mkAlert
  { title: "Error"
  , description: "Your session has expired. Please log in again."
  , variant: enum Destructive
  }
