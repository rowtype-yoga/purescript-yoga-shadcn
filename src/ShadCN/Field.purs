module ShadCN.Field where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

fieldSet :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
fieldSet props = createElement (el "fieldset") (mergeProps { className: "flex flex-col gap-6" } props)

fieldGroup :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
fieldGroup props = createElement (el "div") (mergeProps { className: "flex w-full flex-col gap-7" } props)

field :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
field props = createElement (el "div") (mergeProps { className: "group/field flex w-full gap-3 flex-col", role: "group" } props)

fieldContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
fieldContent props = createElement (el "div") (mergeProps { className: "flex flex-1 flex-col gap-1.5 leading-snug" } props)

fieldLabel :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
fieldLabel props = createElement (el "div") (mergeProps { className: "flex w-fit items-center gap-2 text-sm leading-snug font-medium" } props)

fieldDescription :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
fieldDescription props = createElement (el "p") (mergeProps { className: "text-muted-foreground text-sm leading-normal font-normal" } props)

fieldError :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
fieldError props = createElement (el "div") (mergeProps { className: "text-destructive text-sm font-normal", role: "alert" } props)
