module ShadCN.Dialog where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

dialog :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialog props = createElement Radix.dialogRoot (mergeProps {} props)

dialogTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialogTrigger props = createElement Radix.dialogTrigger (mergeProps {} props)

dialogContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialogContent props kids = createElement Radix.dialogPortal {}
  [ createElement Radix.dialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50" } ([] :: Array JSX)
  , createElement Radix.dialogContent (mergeProps { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 fixed top-[50%] left-[50%] z-50 grid w-full max-w-[calc(100%-2rem)] translate-x-[-50%] translate-y-[-50%] gap-4 rounded-lg border p-6 shadow-lg duration-200 outline-none sm:max-w-lg" } props) kids
  ]

dialogHeader :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialogHeader props = createElement (el "div") (mergeProps { className: "flex flex-col gap-2 text-center sm:text-left" } props)

dialogFooter :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialogFooter props = createElement (el "div") (mergeProps { className: "flex flex-col-reverse gap-2 sm:flex-row sm:justify-end" } props)

dialogTitle :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialogTitle props = createElement Radix.dialogTitle (mergeProps { className: "text-lg leading-none font-semibold" } props)

dialogDescription :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialogDescription props = createElement Radix.dialogDescription (mergeProps { className: "text-muted-foreground text-sm" } props)

dialogClose :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dialogClose props = createElement Radix.dialogClose (mergeProps {} props)
