module ShadCN.Table where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (div, table, thead, tbody, tfoot, tr, th, td, caption)
import Yoga.React.DOM.Internal (class IsJSX)

shadTable :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
shadTable props kids = div { className: "relative w-full overflow-x-auto" }
  [ table (mergeProps { className: "w-full caption-bottom text-sm" } props) kids ]

tableHeader :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableHeader props = thead (mergeProps { className: "[&_tr]:border-b" } props)

tableBody :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableBody props = tbody (mergeProps { className: "[&_tr:last-child]:border-0" } props)

tableFooter :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableFooter props = tfoot (mergeProps { className: "bg-muted/50 border-t font-medium [&>tr]:last:border-b-0" } props)

tableRow :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableRow props = tr (mergeProps { className: "hover:bg-muted/50 data-[state=selected]:bg-muted border-b transition-colors" } props)

tableHead :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableHead props = th (mergeProps { className: "text-foreground h-10 px-2 text-left align-middle font-medium whitespace-nowrap" } props)

tableCell :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableCell props = td (mergeProps { className: "p-2 align-middle whitespace-nowrap" } props)

tableCaption :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tableCaption props = caption (mergeProps { className: "text-muted-foreground mt-4 text-sm" } props)
