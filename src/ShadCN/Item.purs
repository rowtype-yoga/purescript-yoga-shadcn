module ShadCN.Item where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

item :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
item props = createElement (el "div") (mergeProps { className: "group/item flex items-center border border-transparent text-sm rounded-md transition-colors flex-wrap p-4 gap-4" } props)

itemGroup :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
itemGroup props = createElement (el "div") (mergeProps { className: "flex flex-col", role: "list" } props)

itemMedia :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
itemMedia props = createElement (el "div") (mergeProps { className: "flex shrink-0 items-center justify-center gap-2" } props)

itemContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
itemContent props = createElement (el "div") (mergeProps { className: "flex flex-1 flex-col gap-1" } props)

itemTitle :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
itemTitle props = createElement (el "div") (mergeProps { className: "flex w-fit items-center gap-2 text-sm leading-snug font-medium" } props)

itemDescription :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
itemDescription props = createElement (el "p") (mergeProps { className: "text-muted-foreground line-clamp-2 text-sm leading-normal font-normal text-balance" } props)

itemActions :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
itemActions props = createElement (el "div") (mergeProps { className: "flex items-center gap-2" } props)
