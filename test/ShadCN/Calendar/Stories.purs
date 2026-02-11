module ShadCN.Calendar.Stories (demo) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Calendar (calendar)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import YogaStories.Story (story)

mkCalendar :: {} -> JSX
mkCalendar = component "CalendarStory" \_ -> React.do
  pure $ div { className: "max-w-sm" }
    [ calendar { mode: "single" } ]

demo :: JSX
demo = story "demo" mkCalendar {}
