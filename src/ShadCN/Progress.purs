module ShadCN.Progress where

import Prelude
import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (createElement)
import ShadCN.Radix as Radix

progress :: forall r. Number -> { | r } -> JSX
progress value props = createElement Radix.progressRoot (mergeProps { className: "bg-primary/20 relative h-2 w-full overflow-hidden rounded-full", value } props)
  [ createElement Radix.progressIndicator { className: "bg-primary h-full w-full flex-1 transition-all", style: { transform: "translateX(-" <> show (100.0 - value) <> "%)" } } ([] :: Array JSX) ]
