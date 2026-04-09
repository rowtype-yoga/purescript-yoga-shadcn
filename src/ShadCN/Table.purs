module ShadCN.Table where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

shadTable :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
shadTable props kids = div { className: "relative w-full overflow-x-auto" }
  [ createElement (el "table") (mergeProps { className: "w-full caption-bottom text-sm" } props) kids ]

tableHeader :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableHeader props = createElement (el "thead") (mergeProps { className: "[&_tr]:border-b" } props)

tableBody :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableBody props = createElement (el "tbody") (mergeProps { className: "[&_tr:last-child]:border-0" } props)

tableFooter :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableFooter props = createElement (el "tfoot") (mergeProps { className: "bg-muted/50 border-t font-medium [&>tr]:last:border-b-0" } props)

tableRow :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableRow props = createElement (el "tr") (mergeProps { className: "hover:bg-muted/50 data-[state=selected]:bg-muted border-b transition-colors" } props)

tableHead :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableHead props = createElement (el "th") (mergeProps { className: "text-foreground h-10 px-2 text-left align-middle font-medium whitespace-nowrap" } props)

tableCell :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableCell props = createElement (el "td") (mergeProps { className: "p-2 align-middle whitespace-nowrap" } props)

tableCaption :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableCaption props = createElement (el "caption") (mergeProps { className: "text-muted-foreground mt-4 text-sm" } props)
