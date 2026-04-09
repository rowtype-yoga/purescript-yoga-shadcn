module ShadCN.Accordion where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

accordion :: forall r kids. IsJSX kids => { type :: String, collapsible :: Boolean | r } -> kids -> JSX
accordion props = createElement Radix.accordionRoot (mergeProps {} props)

accordionItem :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
accordionItem value props = createElement Radix.accordionItem (mergeProps { value, className: "border-b last:border-b-0" } props)

accordionTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
accordionTrigger props kids = createElement Radix.accordionHeader { className: "flex" }
  [ createElement Radix.accordionTrigger (mergeProps { className: "flex flex-1 items-start justify-between gap-4 rounded-md py-4 text-left text-sm font-medium transition-all outline-none hover:underline [&[data-state=open]>svg]:rotate-180" } props) kids ]

accordionContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
accordionContent props = createElement Radix.accordionContent (mergeProps { className: "data-[state=closed]:animate-accordion-up data-[state=open]:animate-accordion-down overflow-hidden text-sm" } props)
