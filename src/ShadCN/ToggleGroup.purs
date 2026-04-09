module ShadCN.ToggleGroup where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

toggleGroup :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
toggleGroup type_ props = createElement Radix.toggleGroupRoot (mergeProps { className: "flex w-fit items-center gap-0 rounded-md", type: type_ } props)

toggleGroupItem :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
toggleGroupItem value props = createElement Radix.toggleGroupItem (mergeProps { className: "inline-flex items-center justify-center gap-2 rounded-none text-sm font-medium hover:bg-muted hover:text-muted-foreground disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground outline-none transition-[color,box-shadow] whitespace-nowrap first:rounded-l-md last:rounded-r-md h-9 px-3 min-w-9", value } props)
