module ShadCN.Sheet where

import Prelude
import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

sheet :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sheet props = createElement Radix.dialogRoot (mergeProps {} props)

sheetTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sheetTrigger props = createElement Radix.dialogTrigger (mergeProps {} props)

sheetContent :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
sheetContent side props kids = createElement Radix.dialogPortal {}
  [ createElement Radix.dialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50" } ([] :: Array JSX)
  , createElement Radix.dialogContent (mergeProps { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out fixed z-50 flex flex-col gap-4 shadow-lg transition ease-in-out data-[state=closed]:duration-300 data-[state=open]:duration-500 " <> sideClass side } props) kids
  ]
  where
  sideClass "left" = "data-[state=closed]:slide-out-to-left data-[state=open]:slide-in-from-left inset-y-0 left-0 h-full w-3/4 border-r sm:max-w-sm"
  sideClass "top" = "data-[state=closed]:slide-out-to-top data-[state=open]:slide-in-from-top inset-x-0 top-0 h-auto border-b"
  sideClass "bottom" = "data-[state=closed]:slide-out-to-bottom data-[state=open]:slide-in-from-bottom inset-x-0 bottom-0 h-auto border-t"
  sideClass _ = "data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right inset-y-0 right-0 h-full w-3/4 border-l sm:max-w-sm"

sheetHeader :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sheetHeader props = div (mergeProps { className: "flex flex-col gap-1.5 p-4" } props)

sheetFooter :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sheetFooter props = div (mergeProps { className: "mt-auto flex flex-col gap-2 p-4" } props)

sheetTitle :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sheetTitle props = createElement Radix.dialogTitle (mergeProps { className: "text-foreground font-semibold" } props)

sheetDescription :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sheetDescription props = createElement Radix.dialogDescription (mergeProps { className: "text-muted-foreground text-sm" } props)

sheetClose :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sheetClose props = createElement Radix.dialogClose (mergeProps {} props)
