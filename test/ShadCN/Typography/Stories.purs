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
    [ typH1 (text "Taxing Laughter: The Joke Tax Chronicles")
    , typLead (text "Once upon a time, in a far-off land, there was a very lazy king who spent all day lounging on his throne.")
    , typH2 (text "The King's Plan")
    , typP (text "The king thought long and hard, and finally came up with a brilliant plan: he would tax the jokes in the kingdom.")
    , typBlockquote (text "After all, he said, everyone enjoys a good joke, so it's only fair that they should pay for the privilege.")
    , typH3 (text "The Joke Tax")
    , typP (text "The king's subjects were not amused. They grumbled and complained, but the king was firm:")
    , typList
        [ li {} (text "1st level of puns: 5 gold coins")
        , li {} (text "2nd level of jokes: 10 gold coins")
        , li {} (text "3rd level of one-liners: 20 gold coins")
        ]
    , typH4 (text "The Jester's Revolt")
    , typP [ text "The court jester, known as ", typInlineCode (text "Jokester"), text ", was not happy with the new tax." ]
    , typLarge (text "Never underestimate the power of a good laugh.")
    , typSmall (text "And always be careful of bad ideas.")
    , typMuted (text "The kingdom was never the same after that.")
    ]

default :: JSX
default = S.story "default" mkTypography {}
