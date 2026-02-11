module ShadCN.AlertDialog.Stories (default) where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.AlertDialog (alertDialog, alertDialogAction, alertDialogCancel, alertDialogContent, alertDialogDescription, alertDialogFooter, alertDialogHeader, alertDialogTitle, alertDialogTrigger)
import ShadCN.Button as Btn
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkAlertDialog :: {} -> JSX
mkAlertDialog = component "AlertDialogStory" \_ -> React.do
  pure $ div { className: "flex flex-col gap-4" }
    [ p { className: "text-muted-foreground text-sm" } (text "A modal dialog that interrupts the user with important content and expects a response.")
    , alertDialog
        [ alertDialogTrigger
            [ Btn.btn Btn.outline Btn.md (text "Show Dialog") ]
        , alertDialogContent
            [ alertDialogHeader
                [ alertDialogTitle (text "Are you absolutely sure?")
                , alertDialogDescription (text "This action cannot be undone. This will permanently delete your account and remove your data from our servers.")
                ]
            , alertDialogFooter
                [ alertDialogCancel (text "Cancel")
                , alertDialogAction (text "Continue")
                ]
            ]
        ]
    ]

default :: JSX
default = S.story "default" mkAlertDialog {}
