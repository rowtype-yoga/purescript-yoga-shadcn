module ShadCN.Button.Stories (default) where

import Prelude hiding (div)

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)
import ShadCN.Button as Btn
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (enum)
import YogaStories.Story (story) as S

data Variant = Default | Destructive | Outline | Secondary | Ghost | Link

derive instance Generic Variant _

data Size = Medium | Small | Large | ExtraSmall

derive instance Generic Size _

variantClass :: Variant -> String
variantClass = case _ of
  Default -> Btn.default
  Destructive -> Btn.destructive
  Outline -> Btn.outline
  Secondary -> Btn.secondary
  Ghost -> Btn.ghost
  Link -> Btn.link

sizeClass :: Size -> String
sizeClass = case _ of
  Medium -> Btn.md
  Small -> Btn.sm
  Large -> Btn.lg
  ExtraSmall -> Btn.xs

mkButton :: { label :: String, variant :: Variant, size :: Size } -> JSX
mkButton = component "ButtonStory" \props -> React.do
  pure $ div { className: "flex flex-col gap-4" }
    [ p { className: "text-muted-foreground text-sm" } (text "Displays a button or a component that looks like a button.")
    , Btn.btn (variantClass props.variant) (sizeClass props.size) (text props.label)
    ]

default :: JSX
default = S.story "default" mkButton
  { label: "Button"
  , variant: enum Default
  , size: enum Medium
  }
