module ShadCN.Command.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Command (command, commandEmpty, commandGroup, commandInput, commandItem, commandList, commandSeparator)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkCommand :: {} -> JSX
mkCommand = component "CommandStory" \_ -> React.do
  pure $ div { className: "flex flex-col gap-4" }
    [ p { className: "text-muted-foreground text-sm" } (text "Command menu for search and quick actions.")
    , div { className: "max-w-sm rounded-lg border" }
        [ command
            [ commandInput "Type a command or search..."
            , commandList
                [ commandEmpty (text "No results found.")
                , commandGroup "Suggestions"
                    [ commandItem (text "Calendar")
                    , commandItem (text "Search Emoji")
                    , commandItem (text "Calculator")
                    ]
                , commandSeparator
                , commandGroup "Settings"
                    [ commandItem (text "Profile")
                    , commandItem (text "Billing")
                    , commandItem (text "Settings")
                    ]
                ]
            ]
        ]
    ]

default :: JSX
default = S.story "default" mkCommand {}
