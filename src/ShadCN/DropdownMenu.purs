module ShadCN.DropdownMenu where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

dropdownMenu :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dropdownMenu props = createElement Radix.dropdownMenuRoot (mergeProps {} props)

dropdownMenuTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dropdownMenuTrigger props = createElement Radix.dropdownMenuTrigger (mergeProps {} props)

dropdownMenuContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dropdownMenuContent props kids = createElement Radix.dropdownMenuPortal {}
  [ createElement Radix.dropdownMenuContent (mergeProps { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md", sideOffset: 4 } props) kids ]

dropdownMenuItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dropdownMenuItem props = createElement Radix.dropdownMenuItem (mergeProps { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50" } props)

dropdownMenuSeparator :: forall r. { | r } -> JSX
dropdownMenuSeparator props = createElement Radix.dropdownMenuSeparator (mergeProps { className: "bg-border -mx-1 my-1 h-px" } props) ([] :: Array JSX)

dropdownMenuLabel :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
dropdownMenuLabel props = createElement Radix.dropdownMenuLabel (mergeProps { className: "px-2 py-1.5 text-sm font-medium" } props)
