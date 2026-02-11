module ShadCN.Progress.Stories (story) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Progress as Progress
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import YogaStories.Controls (slider)
import YogaStories.Story (story) as S

mkProgress :: { value :: Number } -> JSX
mkProgress = component "ProgressStory" \props -> React.do
  pure $ div { className: "w-64" }
    [ Progress.progress props.value ]

story :: JSX
story = S.story "story" mkProgress
  { value: slider { value: 60.0, min: 0.0, max: 100.0, step: 1.0 } }
