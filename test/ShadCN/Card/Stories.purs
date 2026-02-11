module ShadCN.Card.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Card (card, cardContent, cardDescription, cardFooter, cardHeader, cardTitle)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkCard :: {} -> JSX
mkCard = component "CardStory" \_ -> React.do
  pure $ div { className: "max-w-sm" }
    [ card
        [ cardHeader
            [ cardTitle (text "Card Title")
            , cardDescription (text "Card Description")
            ]
        , cardContent
            [ p {} (text "Card Content") ]
        , cardFooter
            [ p {} (text "Card Footer") ]
        ]
    ]

default :: JSX
default = S.story "default" mkCard {}
