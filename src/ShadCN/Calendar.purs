module ShadCN.Calendar where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.Internal (createElement)

foreign import dayPicker :: forall r. ReactComponent { | r }
foreign import mergeProps :: forall a b c. a -> b -> c

calendar :: forall r. { | r } -> JSX
calendar props = createElement dayPicker
  (mergeProps props { className: "bg-background group/calendar p-3 [--cell-size:2rem]", showOutsideDays: true })
  ([] :: Array JSX)
