module ShadCN.Card where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX)

card :: forall kids. IsJSX kids => kids -> JSX
card = div { className: "rounded-xl border bg-card text-card-foreground shadow-sm" }

cardHeader :: forall kids. IsJSX kids => kids -> JSX
cardHeader = div { className: "flex flex-col space-y-1.5 p-6" }

cardTitle :: forall kids. IsJSX kids => kids -> JSX
cardTitle = div { className: "font-semibold leading-none tracking-tight" }

cardDescription :: forall kids. IsJSX kids => kids -> JSX
cardDescription = div { className: "text-muted-foreground text-sm" }

cardContent :: forall kids. IsJSX kids => kids -> JSX
cardContent = div { className: "p-6 pt-0" }

cardFooter :: forall kids. IsJSX kids => kids -> JSX
cardFooter = div { className: "flex items-center p-6 pt-0" }
