module ShadCN.HoverCard where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

hoverCard :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
hoverCard props = createElement Radix.hoverCardRoot (mergeProps {} props)

hoverCardTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
hoverCardTrigger props = createElement Radix.hoverCardTrigger (mergeProps {} props)

hoverCardContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
hoverCardContent props kids = createElement Radix.hoverCardPortal {}
  [ createElement Radix.hoverCardContent (mergeProps { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 w-64 rounded-md border p-4 shadow-md outline-hidden", sideOffset: 4 } props) kids ]
