module ShadCN.Badge where

import Prelude
import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

base :: String
base = "inline-flex items-center justify-center rounded-full border border-transparent px-2 py-0.5 text-xs font-medium w-fit whitespace-nowrap shrink-0 gap-1 transition-[color,box-shadow] overflow-hidden"

badgeDefault :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
badgeDefault props = createElement (el "span") (mergeProps { className: base <> " bg-primary text-primary-foreground" } props)

badgeSecondary :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
badgeSecondary props = createElement (el "span") (mergeProps { className: base <> " bg-secondary text-secondary-foreground" } props)

badgeDestructive :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
badgeDestructive props = createElement (el "span") (mergeProps { className: base <> " bg-destructive text-white" } props)

badgeOutline :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
badgeOutline props = createElement (el "span") (mergeProps { className: base <> " border-border text-foreground" } props)
