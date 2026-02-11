module ShadCN.AlertDialog.Stories (default) where

import Prelude

import React.Basic (JSX)
import ShadCN.AlertDialog (alertDialog, alertDialogAction, alertDialogCancel, alertDialogContent, alertDialogDescription, alertDialogFooter, alertDialogHeader, alertDialogTitle, alertDialogTrigger)
import ShadCN.Button as Btn
import Yoga.React (component)
import Yoga.React.DOM.Internal (text)
import YogaStories.Story (story) as S

mkAlertDialog :: {} -> JSX
mkAlertDialog = component "AlertDialogStory" \_ -> React.do
  pure $ alertDialog
    [ alertDialogTrigger
        [ Btn.btn Btn.outline Btn.md (text "Delete Account") ]
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

default :: JSX
default = S.story "default" mkAlertDialog {}
