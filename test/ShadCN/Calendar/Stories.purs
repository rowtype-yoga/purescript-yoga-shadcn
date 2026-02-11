module ShadCN.Calendar.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Calendar (calendar)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkCalendar :: {} -> JSX
mkCalendar = component "CalendarStory" \_ -> React.do
  pure $ div { className: "flex flex-col gap-4" }
    [ p { className: "text-muted-foreground text-sm" } (text "A calendar component that allows users to select a date or a range of dates.")
    , div { className: "rounded-lg border w-fit" }
        [ calendar { mode: "single" } ]
    ]

default :: JSX
default = S.story "default" mkCalendar {}
