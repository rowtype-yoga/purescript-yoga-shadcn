module ShadCN.Internal where

import React.Basic (ReactComponent)

foreign import mergeProps :: forall a b r. a -> b -> { | r }
foreign import el :: forall r. String -> ReactComponent { | r }
