module ShadCN.Menubar where

import Prelude
import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

menubar :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
menubar props = createElement Radix.menubarRoot (mergeProps { className: "bg-background flex h-9 items-center gap-1 rounded-md border p-1 shadow-xs" } props)

menubarMenu :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
menubarMenu props = createElement Radix.menubarMenu (mergeProps {} props)

menubarTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
menubarTrigger props = createElement Radix.menubarTrigger (mergeProps { className: "focus:bg-accent focus:text-accent-foreground data-[state=open]:bg-accent data-[state=open]:text-accent-foreground flex items-center rounded-sm px-2 py-1 text-sm font-medium outline-hidden select-none" } props)

menubarContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
menubarContent props kids = createElement Radix.menubarPortal {}
  [ createElement Radix.menubarContent (mergeProps { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 z-50 min-w-[12rem] overflow-hidden rounded-md border p-1 shadow-md", sideOffset: 8, alignOffset: negate 4 } props) kids ]

menubarItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
menubarItem props = createElement Radix.menubarItem (mergeProps { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50" } props)

menubarSeparator :: forall r. { | r } -> JSX
menubarSeparator props = createElement Radix.menubarSeparator (mergeProps { className: "bg-border -mx-1 my-1 h-px" } props) ([] :: Array JSX)
