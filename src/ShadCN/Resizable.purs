module ShadCN.Resizable where

import React.Basic (JSX, ReactComponent)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import resizablePanelGroup_ :: forall r. ReactComponent { | r }
foreign import resizablePanel_ :: forall r. ReactComponent { | r }
foreign import resizableHandle_ :: forall r. ReactComponent { | r }

resizablePanelGroup :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
resizablePanelGroup direction props = createElement resizablePanelGroup_ (mergeProps { className: "flex h-full w-full data-[panel-group-direction=vertical]:flex-col", direction } props)

resizablePanel :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
resizablePanel props = createElement resizablePanel_ (mergeProps {} props)

resizableHandle :: forall r. { | r } -> JSX
resizableHandle props = createElement resizableHandle_ (mergeProps { className: "bg-border relative flex w-px items-center justify-center" } props) ([] :: Array JSX)
