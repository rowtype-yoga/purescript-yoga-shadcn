module ShadCN.Calendar where

import React.Basic (JSX, ReactComponent)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (createElement)

foreign import dayPicker :: forall r. ReactComponent { | r }

calendar :: forall r. { | r } -> JSX
calendar props = createElement dayPicker
  (mergeProps { className: "bg-background group/calendar p-3 [--cell-size:2rem]", showOutsideDays: true } props)
  ([] :: Array JSX)
