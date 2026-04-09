module ShadCN.Separator where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (createElement)
import ShadCN.Radix as Radix

separator :: forall r. { | r } -> JSX
separator props = createElement Radix.separatorRoot (mergeProps { className: "bg-border shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-px", orientation: "horizontal", decorative: true } props) ([] :: Array JSX)

separatorVertical :: forall r. { | r } -> JSX
separatorVertical props = createElement Radix.separatorRoot (mergeProps { className: "bg-border shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-px", orientation: "vertical", decorative: true } props) ([] :: Array JSX)
