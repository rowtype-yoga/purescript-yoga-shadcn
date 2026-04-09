module ShadCN.Select where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

select :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
select props = createElement Radix.selectRoot (mergeProps {} props)

selectTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
selectTrigger props = createElement Radix.selectTrigger (mergeProps { className: "border-input data-[placeholder]:text-muted-foreground focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 flex w-fit items-center justify-between gap-2 rounded-md border bg-transparent px-3 py-2 text-sm whitespace-nowrap shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50 h-9" } props)

selectValue :: forall r. String -> { | r } -> JSX
selectValue placeholder props = createElement Radix.selectValue (mergeProps { placeholder } props) ([] :: Array JSX)

selectContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
selectContent props kids = createElement Radix.selectPortal {}
  [ createElement Radix.selectContent (mergeProps { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 relative z-50 min-w-[8rem] overflow-hidden rounded-md border shadow-md" } props)
    [ createElement Radix.selectViewport { className: "p-1" } kids ] ]

selectItem :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
selectItem value props kids = createElement Radix.selectItem (mergeProps { className: "focus:bg-accent focus:text-accent-foreground relative flex w-full cursor-default items-center gap-2 rounded-sm py-1.5 pr-8 pl-2 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50", value } props)
  [ createElement Radix.selectItemText {} kids ]

selectGroup :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
selectGroup props = createElement Radix.selectGroup (mergeProps {} props)

selectLabel :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
selectLabel props = createElement Radix.selectLabel (mergeProps { className: "text-muted-foreground px-2 py-1.5 text-xs" } props)

selectSeparator :: forall r. { | r } -> JSX
selectSeparator props = createElement Radix.selectSeparator (mergeProps { className: "bg-border pointer-events-none -mx-1 my-1 h-px" } props) ([] :: Array JSX)
