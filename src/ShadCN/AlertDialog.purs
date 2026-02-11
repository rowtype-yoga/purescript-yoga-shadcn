module ShadCN.AlertDialog where

import Prelude

import React.Basic (JSX)
import ShadCN.Button as Btn
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

alertDialog :: forall kids. IsJSX kids => kids -> JSX
alertDialog = createElement Radix.alertDialogRoot {}

alertDialogTrigger :: forall kids. IsJSX kids => kids -> JSX
alertDialogTrigger = createElement Radix.alertDialogTrigger {}

alertDialogContent :: forall kids. IsJSX kids => kids -> JSX
alertDialogContent kids = createElement Radix.alertDialogPortal {}
  [ createElement Radix.alertDialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/80" } ([] :: Array JSX)
  , createElement Radix.alertDialogContent { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 fixed top-[50%] left-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border p-6 shadow-lg duration-200 sm:rounded-lg" } kids
  ]

alertDialogHeader :: forall kids. IsJSX kids => kids -> JSX
alertDialogHeader = div { className: "flex flex-col space-y-2 text-center sm:text-left" }

alertDialogFooter :: forall kids. IsJSX kids => kids -> JSX
alertDialogFooter = div { className: "flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2" }

alertDialogTitle :: forall kids. IsJSX kids => kids -> JSX
alertDialogTitle = createElement Radix.alertDialogTitle { className: "text-lg font-semibold" }

alertDialogDescription :: forall kids. IsJSX kids => kids -> JSX
alertDialogDescription = createElement Radix.alertDialogDescription { className: "text-muted-foreground text-sm" }

alertDialogAction :: forall kids. IsJSX kids => kids -> JSX
alertDialogAction = createElement Radix.alertDialogAction { className: Btn.base <> " " <> Btn.default <> " " <> Btn.md }

alertDialogCancel :: forall kids. IsJSX kids => kids -> JSX
alertDialogCancel = createElement Radix.alertDialogCancel { className: Btn.base <> " " <> Btn.outline <> " " <> Btn.md <> " mt-2 sm:mt-0" }
