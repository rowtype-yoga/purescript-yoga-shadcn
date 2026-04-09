module ShadCN.Skeleton where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML.Div (div_)

skeleton :: forall r. { | r } -> JSX
skeleton props = div_ (mergeProps { className: "bg-accent animate-pulse rounded-md" } props)
