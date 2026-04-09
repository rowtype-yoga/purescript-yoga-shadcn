module ShadCN.Collapsible where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

collapsible :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
collapsible props = createElement Radix.collapsibleRoot (mergeProps {} props)

collapsibleTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
collapsibleTrigger props = createElement Radix.collapsibleTrigger (mergeProps {} props)

collapsibleContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
collapsibleContent props = createElement Radix.collapsibleContent (mergeProps {} props)
