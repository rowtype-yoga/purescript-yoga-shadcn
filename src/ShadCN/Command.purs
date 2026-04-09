module ShadCN.Command where

import React.Basic (JSX, ReactComponent)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import commandRoot_ :: forall r. ReactComponent { | r }
foreign import commandInput_ :: forall r. ReactComponent { | r }
foreign import commandList_ :: forall r. ReactComponent { | r }
foreign import commandEmpty_ :: forall r. ReactComponent { | r }
foreign import commandGroup_ :: forall r. ReactComponent { | r }
foreign import commandItem_ :: forall r. ReactComponent { | r }
foreign import commandSeparator_ :: forall r. ReactComponent { | r }
foreign import commandLoading_ :: forall r. ReactComponent { | r }

command :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
command props = createElement commandRoot_ (mergeProps { className: "flex h-full w-full flex-col overflow-hidden rounded-md bg-popover text-popover-foreground" } props)

commandInput :: forall r. String -> { | r } -> JSX
commandInput placeholder props = createElement (el "div") { className: "flex items-center border-b px-3" }
  [ createElement commandInput_ (mergeProps { className: "flex h-11 w-full rounded-md bg-transparent py-3 text-sm outline-none placeholder:text-muted-foreground disabled:cursor-not-allowed disabled:opacity-50", placeholder } props) ([] :: Array JSX) ]

commandList :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
commandList props = createElement commandList_ (mergeProps { className: "max-h-[300px] overflow-y-auto overflow-x-hidden" } props)

commandEmpty :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
commandEmpty props = createElement commandEmpty_ (mergeProps { className: "py-6 text-center text-sm" } props)

commandGroup :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
commandGroup heading props = createElement commandGroup_ (mergeProps { className: "overflow-hidden p-1 text-foreground [&_[cmdk-group-heading]]:px-2 [&_[cmdk-group-heading]]:py-1.5 [&_[cmdk-group-heading]]:text-xs [&_[cmdk-group-heading]]:font-medium [&_[cmdk-group-heading]]:text-muted-foreground", heading } props)

commandItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
commandItem props = createElement commandItem_ (mergeProps { className: "relative flex cursor-default gap-2 select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none data-[disabled=true]:pointer-events-none data-[selected=true]:bg-accent data-[selected=true]:text-accent-foreground data-[disabled=true]:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0" } props)

commandSeparator :: forall r. { | r } -> JSX
commandSeparator props = createElement commandSeparator_ (mergeProps { className: "-mx-1 h-px bg-border" } props) ([] :: Array JSX)

commandShortcut :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
commandShortcut props = createElement (el "span") (mergeProps { className: "ml-auto text-xs tracking-widest text-muted-foreground" } props)
