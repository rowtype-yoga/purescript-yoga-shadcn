module ShadCN.Kbd where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (kbd)
import Yoga.React.DOM.Internal (class IsJSX)

kbdKey :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
kbdKey props = kbd (mergeProps { className: "bg-muted text-muted-foreground pointer-events-none inline-flex h-5 w-fit min-w-5 items-center justify-center gap-1 rounded-sm px-1 font-sans text-xs font-medium select-none" } props)

kbdGroup :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
kbdGroup props = kbd (mergeProps { className: "inline-flex items-center gap-1" } props)
