module ShadCN.Alert.Stories (story) where

import Prelude

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import ShadCN.Alert (alert, alertDestructive, alertDescription, alertTitle)
import Yoga.React (component)
import YogaStories.Controls (enum)
import YogaStories.Story (story) as S

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

story :: JSX
story = S.story "story" mkAlert
  { title: "Heads up!"
  , description: "You can add components to your app using the CLI."
  , variant: enum Default
  }
