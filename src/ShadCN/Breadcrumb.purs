module ShadCN.Breadcrumb where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (nav, ol, li, a, span)
import Yoga.React.DOM.Internal (class IsJSX, text)

breadcrumb :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumb props = nav (mergeProps {} props)

breadcrumbList :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumbList props = ol (mergeProps { className: "text-muted-foreground flex flex-wrap items-center gap-1.5 text-sm break-words sm:gap-2.5" } props)

breadcrumbItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumbItem props = li (mergeProps { className: "inline-flex items-center gap-1.5" } props)

breadcrumbLink :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
breadcrumbLink href props = a (mergeProps { href, className: "hover:text-foreground transition-colors" } props)

breadcrumbPage :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumbPage props = span (mergeProps { className: "text-foreground font-normal" } props)

breadcrumbSeparator :: JSX
breadcrumbSeparator = li { className: "[&>svg]:size-3.5", role: "presentation" } (text "/")
