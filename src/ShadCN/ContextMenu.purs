module ShadCN.ContextMenu where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

contextMenu :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
contextMenu props = createElement Radix.contextMenuRoot (mergeProps {} props)

contextMenuTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
contextMenuTrigger props = createElement Radix.contextMenuTrigger (mergeProps {} props)

contextMenuContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
contextMenuContent props kids = createElement Radix.contextMenuPortal {}
  [ createElement Radix.contextMenuContent (mergeProps { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md" } props) kids ]

contextMenuItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
contextMenuItem props = createElement Radix.contextMenuItem (mergeProps { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50" } props)

contextMenuSeparator :: forall r. { | r } -> JSX
contextMenuSeparator props = createElement Radix.contextMenuSeparator (mergeProps { className: "bg-border -mx-1 my-1 h-px" } props) ([] :: Array JSX)

contextMenuLabel :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
contextMenuLabel props = createElement Radix.contextMenuLabel (mergeProps { className: "text-foreground px-2 py-1.5 text-sm font-medium" } props)
