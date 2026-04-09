module ShadCN.InputGroup where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

inputGroup :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
inputGroup props = createElement (el "div") (mergeProps { className: "border-input dark:bg-input/30 relative flex w-full items-center rounded-md border shadow-xs transition-[color,box-shadow] outline-none h-9 min-w-0", role: "group" } props)

inputGroupAddon :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
inputGroupAddon props = createElement (el "div") (mergeProps { className: "text-muted-foreground flex h-auto items-center justify-center gap-2 py-1.5 text-sm font-medium select-none order-first pl-3" } props)

inputGroupText :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
inputGroupText props = createElement (el "span") (mergeProps { className: "text-muted-foreground flex items-center gap-2 text-sm" } props)
