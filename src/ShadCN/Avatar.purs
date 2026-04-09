module ShadCN.Avatar where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

avatar :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
avatar props = createElement Radix.avatarRoot (mergeProps { className: "relative flex size-8 shrink-0 overflow-hidden rounded-full select-none" } props)

avatarImage :: forall r. String -> { | r } -> JSX
avatarImage src props = createElement Radix.avatarImage (mergeProps { className: "aspect-square size-full", src } props) ([] :: Array JSX)

avatarFallback :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
avatarFallback props = createElement Radix.avatarFallback (mergeProps { className: "bg-muted text-muted-foreground flex size-full items-center justify-center rounded-full text-sm" } props)
