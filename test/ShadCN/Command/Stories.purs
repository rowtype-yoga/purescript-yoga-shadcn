module ShadCN.Command.Stories (story) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Command (command, commandEmpty, commandGroup, commandItem, commandList, commandSeparator)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkCommand :: {} -> JSX
mkCommand = component "CommandStory" \_ -> React.do
  pure $ div { className: "max-w-sm rounded-lg border" }
    [ command
        [ commandList
            [ commandEmpty (text "No results found.")
            , commandGroup
                [ commandItem (text "Calendar")
                , commandItem (text "Search Emoji")
                , commandItem (text "Calculator")
                ]
            , commandSeparator
            , commandGroup
                [ commandItem (text "Profile")
                , commandItem (text "Billing")
                , commandItem (text "Settings")
                ]
            ]
        ]
    ]

story :: JSX
story = S.story "story" mkCommand {}
