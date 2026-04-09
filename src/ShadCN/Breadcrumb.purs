module ShadCN.Breadcrumb where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.HTML (li)
import Yoga.React.DOM.Internal (class IsJSX, createElement, text)

breadcrumb :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumb props = createElement (el "nav") (mergeProps {} props)

breadcrumbList :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumbList props = createElement (el "ol") (mergeProps { className: "text-muted-foreground flex flex-wrap items-center gap-1.5 text-sm break-words sm:gap-2.5" } props)

breadcrumbItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumbItem props = createElement (el "li") (mergeProps { className: "inline-flex items-center gap-1.5" } props)

breadcrumbLink :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
breadcrumbLink href props = createElement (el "a") (mergeProps { href, className: "hover:text-foreground transition-colors" } props)

breadcrumbPage :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
breadcrumbPage props = createElement (el "span") (mergeProps { className: "text-foreground font-normal" } props)

breadcrumbSeparator :: JSX
breadcrumbSeparator = li { className: "[&>svg]:size-3.5", role: "presentation" } (text "/")
