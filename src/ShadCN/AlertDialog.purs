module ShadCN.AlertDialog where

import Prelude

import React.Basic (JSX)
import ShadCN.Button as Btn
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

alertDialog :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialog props = createElement Radix.alertDialogRoot (mergeProps {} props)

alertDialogTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogTrigger props = createElement Radix.alertDialogTrigger (mergeProps {} props)

alertDialogContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogContent props kids = createElement Radix.alertDialogPortal {}
  [ createElement Radix.alertDialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/80" } ([] :: Array JSX)
  , createElement Radix.alertDialogContent (mergeProps { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 fixed top-[50%] left-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border p-6 shadow-lg duration-200 sm:rounded-lg" } props) kids
  ]

alertDialogHeader :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogHeader props = createElement (el "div") (mergeProps { className: "flex flex-col space-y-2 text-center sm:text-left" } props)

alertDialogFooter :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogFooter props = createElement (el "div") (mergeProps { className: "flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2" } props)

alertDialogTitle :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogTitle props = createElement Radix.alertDialogTitle (mergeProps { className: "text-lg font-semibold" } props)

alertDialogDescription :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogDescription props = createElement Radix.alertDialogDescription (mergeProps { className: "text-muted-foreground text-sm" } props)

alertDialogAction :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogAction props = createElement Radix.alertDialogAction (mergeProps { className: Btn.btnCls Btn.default Btn.md } props)

alertDialogCancel :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
alertDialogCancel props = createElement Radix.alertDialogCancel (mergeProps { className: Btn.btnCls Btn.outline Btn.md <> " mt-2 sm:mt-0" } props)
