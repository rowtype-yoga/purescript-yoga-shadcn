module ShadCN.Pagination where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (nav, ul, li, a, span)
import Yoga.React.DOM.Internal (class IsJSX, text)

pagination :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
pagination props = nav (mergeProps { className: "mx-auto flex w-full justify-center", role: "navigation" } props)

paginationContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
paginationContent props = ul (mergeProps { className: "flex flex-row items-center gap-1" } props)

paginationItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
paginationItem props = li (mergeProps {} props)

paginationLink :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
paginationLink href props = a (mergeProps { href, className: "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium h-9 px-4 py-2 hover:bg-accent hover:text-accent-foreground" } props)

paginationEllipsis :: JSX
paginationEllipsis = span { className: "flex size-9 items-center justify-center" } (text "...")
