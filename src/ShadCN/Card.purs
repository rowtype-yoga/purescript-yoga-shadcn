module ShadCN.Card where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

card :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
card props = createElement (el "div") (mergeProps { className: "rounded-xl border bg-card text-card-foreground shadow-sm" } props)

cardHeader :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
cardHeader props = createElement (el "div") (mergeProps { className: "flex flex-col space-y-1.5 p-6" } props)

cardTitle :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
cardTitle props = createElement (el "div") (mergeProps { className: "font-semibold leading-none tracking-tight" } props)

cardDescription :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
cardDescription props = createElement (el "div") (mergeProps { className: "text-muted-foreground text-sm" } props)

cardContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
cardContent props = createElement (el "div") (mergeProps { className: "p-6 pt-0" } props)

cardFooter :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
cardFooter props = createElement (el "div") (mergeProps { className: "flex items-center p-6 pt-0" } props)
