module ShadCN.Calendar.Stories (story) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Calendar (calendar)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import YogaStories.Story (story) as S

mkCalendar :: {} -> JSX
mkCalendar = component "CalendarStory" \_ -> React.do
  pure $ div { className: "max-w-sm" }
    [ calendar { mode: "single" } ]

story :: JSX
story = S.story "story" mkCalendar {}
