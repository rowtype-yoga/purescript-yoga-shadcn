module ShadCN.Pagination where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.HTML (span)
import Yoga.React.DOM.Internal (class IsJSX, createElement, text)

pagination :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
pagination props = createElement (el "nav") (mergeProps { className: "mx-auto flex w-full justify-center", role: "navigation" } props)

paginationContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
paginationContent props = createElement (el "ul") (mergeProps { className: "flex flex-row items-center gap-1" } props)

paginationItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
paginationItem props = createElement (el "li") (mergeProps {} props)

paginationLink :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
paginationLink href props = createElement (el "a") (mergeProps { href, className: "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium h-9 px-4 py-2 hover:bg-accent hover:text-accent-foreground" } props)

paginationEllipsis :: JSX
paginationEllipsis = span { className: "flex size-9 items-center justify-center" } (text "...")
