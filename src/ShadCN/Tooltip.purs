module ShadCN.Tooltip where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

tooltipProvider :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tooltipProvider props = createElement Radix.tooltipProvider (mergeProps { delayDuration: 0 } props)

tooltip :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tooltip props = createElement Radix.tooltipRoot (mergeProps {} props)

tooltipTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tooltipTrigger props = createElement Radix.tooltipTrigger (mergeProps {} props)

tooltipContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tooltipContent props kids = createElement Radix.tooltipPortal {}
  [ createElement Radix.tooltipContent (mergeProps { className: "bg-foreground text-background animate-in fade-in-0 zoom-in-95 data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=closed]:zoom-out-95 z-50 w-fit rounded-md px-3 py-1.5 text-xs text-balance", sideOffset: 0 } props) kids ]
