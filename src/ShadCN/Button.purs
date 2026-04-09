module ShadCN.Button
  ( Variant
  , Size
  , btn
  , btnCls
  , default
  , destructive
  , outline
  , secondary
  , ghost
  , link
  , md
  , sm
  , lg
  , xs
  , icon
  ) where

import Prelude

import Data.Newtype (class Newtype, un)
import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (button)
import Yoga.React.DOM.Internal (class IsJSX)

newtype Variant = Variant String
derive instance Newtype Variant _

newtype Size = Size String
derive instance Newtype Size _

btnCls :: Variant -> Size -> String
btnCls variant size = base <> " " <> un Variant variant <> " " <> un Size size

btn :: Variant -> Size -> forall r kids. IsJSX kids => { | r } -> kids -> JSX
btn variant size props = button (mergeProps { className: btnCls variant size } props)

-- Variants
default :: Variant
default = Variant "bg-primary text-primary-foreground hover:bg-primary/90"

destructive :: Variant
destructive = Variant "bg-destructive text-white hover:bg-destructive/90"

outline :: Variant
outline = Variant "border bg-background shadow-xs hover:bg-accent hover:text-accent-foreground"

secondary :: Variant
secondary = Variant "bg-secondary text-secondary-foreground hover:bg-secondary/80"

ghost :: Variant
ghost = Variant "hover:bg-accent hover:text-accent-foreground"

link :: Variant
link = Variant "text-primary underline-offset-4 hover:underline"

-- Sizes
md :: Size
md = Size "h-9 px-4 py-2"

sm :: Size
sm = Size "h-8 rounded-md gap-1.5 px-3"

lg :: Size
lg = Size "h-10 rounded-md px-6"

xs :: Size
xs = Size "h-6 gap-1 rounded-md px-2 text-xs"

icon :: Size
icon = Size "size-9"

base :: String
base = "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
