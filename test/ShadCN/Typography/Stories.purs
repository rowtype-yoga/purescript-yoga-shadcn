module ShadCN.Typography.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Typography (typBlockquote, typH1, typH2, typH3, typH4, typInlineCode, typLarge, typLead, typList, typMuted, typP, typSmall)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, li)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkTypography :: {} -> JSX
mkTypography = component "TypographyStory" \_ -> React.do
  pure $ div { className: "space-y-4 max-w-2xl" }
    [ typH1 (text "The Joke Tax Chronicles")
    , typLead (text "Once upon a time, in a far-off land, there was a very lazy king.")
    , typH2 (text "The King's Plan")
    , typP (text "The king thought long and hard, and finally came up with a brilliant plan.")
    , typH3 (text "The Joke Tax")
    , typP (text "The king decided to implement a joke tax.")
    , typBlockquote (text "After all, he said, everyone enjoys a good joke, so it's only fair.")
    , typH4 (text "People Taxed")
    , typList
        [ li {} (text "1st level of puns: 5 gold coins")
        , li {} (text "2nd level of jokes: 10 gold coins")
        , li {} (text "3rd level of one-liners: 20 gold coins")
        ]
    , typP [ text "Use ", typInlineCode (text "typH1"), text " for headings." ]
    , typLarge (text "Large text")
    , typSmall (text "Small text")
    , typMuted (text "Muted text")
    ]

default :: JSX
default = S.story "default" mkTypography {}
