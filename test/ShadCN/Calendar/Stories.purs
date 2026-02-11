module ShadCN.Calendar.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Calendar (calendar)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import YogaStories.Story (story) as S

mkCalendar :: {} -> JSX
mkCalendar = component "CalendarStory" \_ -> React.do
  pure $ div { className: "rounded-lg border" }
    [ calendar { mode: "single" } ]

default :: JSX
default = S.story "default" mkCalendar {}
