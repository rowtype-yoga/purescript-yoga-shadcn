module ShadCN.Command where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.HTML (div, span)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import commandRoot_ :: forall r. ReactComponent { | r }
foreign import commandInput_ :: forall r. ReactComponent { | r }
foreign import commandList_ :: forall r. ReactComponent { | r }
foreign import commandEmpty_ :: forall r. ReactComponent { | r }
foreign import commandGroup_ :: forall r. ReactComponent { | r }
foreign import commandItem_ :: forall r. ReactComponent { | r }
foreign import commandSeparator_ :: forall r. ReactComponent { | r }
foreign import commandLoading_ :: forall r. ReactComponent { | r }

command :: forall kids. IsJSX kids => kids -> JSX
command = createElement commandRoot_ { className: "flex h-full w-full flex-col overflow-hidden rounded-md bg-popover text-popover-foreground" }

commandInput :: forall kids. IsJSX kids => kids -> JSX
commandInput kids = div { className: "flex items-center border-b px-3" }
  [ createElement commandInput_ { className: "flex h-11 w-full rounded-md bg-transparent py-3 text-sm outline-none placeholder:text-muted-foreground disabled:cursor-not-allowed disabled:opacity-50" } kids ]

commandList :: forall kids. IsJSX kids => kids -> JSX
commandList = createElement commandList_ { className: "max-h-[300px] overflow-y-auto overflow-x-hidden" }

commandEmpty :: forall kids. IsJSX kids => kids -> JSX
commandEmpty = createElement commandEmpty_ { className: "py-6 text-center text-sm" }

commandGroup :: forall kids. IsJSX kids => kids -> JSX
commandGroup = createElement commandGroup_ { className: "overflow-hidden p-1 text-foreground [&_[cmdk-group-heading]]:px-2 [&_[cmdk-group-heading]]:py-1.5 [&_[cmdk-group-heading]]:text-xs [&_[cmdk-group-heading]]:font-medium [&_[cmdk-group-heading]]:text-muted-foreground" }

commandItem :: forall kids. IsJSX kids => kids -> JSX
commandItem = createElement commandItem_ { className: "relative flex cursor-default gap-2 select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none data-[disabled=true]:pointer-events-none data-[selected=true]:bg-accent data-[selected=true]:text-accent-foreground data-[disabled=true]:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0" }

commandSeparator :: JSX
commandSeparator = createElement commandSeparator_ { className: "-mx-1 h-px bg-border" } ([] :: Array JSX)

commandShortcut :: forall kids. IsJSX kids => kids -> JSX
commandShortcut = span { className: "ml-auto text-xs tracking-widest text-muted-foreground" }
