module ShadCN.ScrollArea where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

scrollArea :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
scrollArea props kids = createElement Radix.scrollAreaRoot (mergeProps { className: "relative" } props)
  [ createElement Radix.scrollAreaViewport { className: "size-full rounded-[inherit]" } kids
  , scrollBar
  , createElement Radix.scrollAreaCorner {} ([] :: Array JSX)
  ]

scrollBar :: JSX
scrollBar = createElement Radix.scrollAreaScrollbar { className: "flex touch-none p-px transition-colors select-none h-full w-2.5 border-l border-l-transparent", orientation: "vertical" }
  [ createElement Radix.scrollAreaThumb { className: "bg-border relative flex-1 rounded-full" } ([] :: Array JSX) ]
