module ShadCN.Progress.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Progress as Progress
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls (slider)
import YogaStories.Story (story) as S

mkProgress :: { value :: Number } -> JSX
mkProgress = component "ProgressStory" \props -> React.do
  pure $ div { className: "flex flex-col gap-4" }
    [ p { className: "text-muted-foreground text-sm" } (text "Displays an indicator showing the completion progress of a task, typically as a progress bar.")
    , div { className: "w-64" }
        [ Progress.progress props.value ]
    ]

default :: JSX
default = S.story "default" mkProgress
  { value: slider { value: 33.0, min: 0.0, max: 100.0, step: 1.0 } }
