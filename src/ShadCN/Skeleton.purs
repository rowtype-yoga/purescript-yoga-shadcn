module ShadCN.Skeleton where

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (createElement)

skeleton :: forall r. { | r } -> JSX
skeleton props = createElement (el "div") (mergeProps { className: "bg-accent animate-pulse rounded-md" } props) ([] :: Array JSX)
