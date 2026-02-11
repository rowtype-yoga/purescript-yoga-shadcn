module ShadCN.Card.Stories (default) where

import Prelude hiding (div)

import Data.Maybe (Maybe(..))
import React.Basic (JSX)
import ShadCN.Button as Btn
import ShadCN.Card (card, cardContent, cardDescription, cardFooter, cardHeader, cardTitle)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkCard :: { title :: String, description :: String, body :: String, footer :: Maybe String } -> JSX
mkCard = component "CardStory" \props -> React.do
  pure $ div { className: "max-w-sm" }
    [ card
        [ cardHeader
            [ cardTitle (text props.title)
            , cardDescription (text props.description)
            ]
        , cardContent
            [ p {} (text props.body) ]
        , case props.footer of
            Nothing -> mempty
            Just f -> cardFooter [ Btn.btn Btn.default Btn.md (text f) ]
        ]
    ]

default :: JSX
default = S.story "default" mkCard
  { title: "Notifications"
  , description: "You have 3 unread messages."
  , body: "Push notifications are enabled for this device."
  , footer: Just "Mark all as read"
  }
