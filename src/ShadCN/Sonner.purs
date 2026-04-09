module ShadCN.Sonner where

import React.Basic (JSX, ReactComponent)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (createElement)

foreign import toaster :: forall r. ReactComponent { | r }

sonner :: forall r. { | r } -> JSX
sonner props = createElement toaster (mergeProps {} props) ([] :: Array JSX)
