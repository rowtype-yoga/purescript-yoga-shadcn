module ShadCN.Chart where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

chartContainer :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
chartContainer props = createElement (el "div") (mergeProps { className: "flex aspect-video justify-center text-xs" } props)
