module ShadCN.Toast.Stories (demo) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Toast (toast, toastDescription, toastProvider, toastTitle, toastViewport)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story)

mkToast :: {} -> JSX
mkToast = component "ToastStory" \_ -> React.do
  pure $ div { className: "relative min-h-[200px]" }
    [ toastProvider
        [ toast
            [ toastTitle (text "Scheduled: Catch up")
            , toastDescription (text "Friday, February 10, 2025 at 5:57 PM")
            ]
        , toastViewport
        ]
    ]

demo :: JSX
demo = story "demo" mkToast {}
