module ShadCN.NativeSelect where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

nativeSelect :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
nativeSelect props kids = div { className: "relative" }
  [ createElement (el "select") (mergeProps { className: "border-input bg-transparent text-foreground focus-visible:border-ring focus-visible:ring-ring/50 h-9 w-full appearance-none rounded-md border py-1 pr-8 pl-3 text-base shadow-xs outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50 md:text-sm" } props) kids
  ]
