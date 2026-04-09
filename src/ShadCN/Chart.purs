module ShadCN.Chart where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX)

chartContainer :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
chartContainer props = div (mergeProps { className: "flex aspect-video justify-center text-xs" } props)
