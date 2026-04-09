module ShadCN.Toggle where

import Prelude
import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

toggleBase :: String
toggleBase = "inline-flex items-center justify-center gap-2 rounded-md text-sm font-medium hover:bg-muted hover:text-muted-foreground disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground focus-visible:ring-ring/50 focus-visible:ring-[3px] outline-none transition-[color,box-shadow] whitespace-nowrap"

toggle :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toggle props = createElement Radix.toggleRoot (mergeProps { className: toggleBase <> " bg-transparent h-9 px-2 min-w-9" } props)

toggleOutline :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toggleOutline props = createElement Radix.toggleRoot (mergeProps { className: toggleBase <> " border border-input bg-transparent shadow-xs h-9 px-2 min-w-9" } props)

toggleSm :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toggleSm props = createElement Radix.toggleRoot (mergeProps { className: toggleBase <> " bg-transparent h-8 px-1.5 min-w-8" } props)

toggleLg :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toggleLg props = createElement Radix.toggleRoot (mergeProps { className: toggleBase <> " bg-transparent h-10 px-2.5 min-w-10" } props)
