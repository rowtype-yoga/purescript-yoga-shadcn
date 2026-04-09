module ShadCN.AspectRatio where

import Prelude
import Data.Int (toNumber)
import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

by :: forall r kids. IsJSX kids => Int -> Int -> { | r } -> kids -> JSX
by w h props = createElement Radix.aspectRatioRoot (mergeProps { ratio: toNumber w / toNumber h } props)
