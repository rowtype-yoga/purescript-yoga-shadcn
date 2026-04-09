module ShadCN.RadioGroup where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

radioGroup :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
radioGroup props = createElement Radix.radioGroupRoot (mergeProps { className: "grid gap-3" } props)

radioGroupItem :: forall r. String -> { | r } -> JSX
radioGroupItem value props = createElement Radix.radioGroupItem (mergeProps { className: "border-input text-primary focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 aspect-square size-4 shrink-0 rounded-full border shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50", value } props)
  [ createElement Radix.radioGroupIndicator { className: "relative flex items-center justify-center" } ([] :: Array JSX) ]
