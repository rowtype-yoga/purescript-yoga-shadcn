module ShadCN.Typography where

import Prelude hiding (div)

import React.Basic (JSX)
import Yoga.React.DOM.HTML (blockquote, code, div, h1, h2, h3, h4, p, small, ul)
import Yoga.React.DOM.Internal (class IsJSX)

typH1 :: forall kids. IsJSX kids => kids -> JSX
typH1 = h1 { className: "scroll-m-20 text-center text-4xl font-extrabold tracking-tight text-balance" }

typH2 :: forall kids. IsJSX kids => kids -> JSX
typH2 = h2 { className: "scroll-m-20 border-b pb-2 text-3xl font-semibold tracking-tight first:mt-0" }

typH3 :: forall kids. IsJSX kids => kids -> JSX
typH3 = h3 { className: "scroll-m-20 text-2xl font-semibold tracking-tight" }

typH4 :: forall kids. IsJSX kids => kids -> JSX
typH4 = h4 { className: "scroll-m-20 text-xl font-semibold tracking-tight" }

typP :: forall kids. IsJSX kids => kids -> JSX
typP = p { className: "leading-7 [&:not(:first-child)]:mt-6" }

typBlockquote :: forall kids. IsJSX kids => kids -> JSX
typBlockquote = blockquote { className: "mt-6 border-l-2 pl-6 italic" }

typList :: forall kids. IsJSX kids => kids -> JSX
typList = ul { className: "my-6 ml-6 list-disc [&>li]:mt-2" }

typInlineCode :: forall kids. IsJSX kids => kids -> JSX
typInlineCode = code { className: "bg-muted relative rounded px-[0.3rem] py-[0.2rem] font-mono text-sm font-semibold" }

typLead :: forall kids. IsJSX kids => kids -> JSX
typLead = p { className: "text-muted-foreground text-xl" }

typLarge :: forall kids. IsJSX kids => kids -> JSX
typLarge = div { className: "text-lg font-semibold" }

typSmall :: forall kids. IsJSX kids => kids -> JSX
typSmall = small { className: "text-sm leading-none font-medium" }

typMuted :: forall kids. IsJSX kids => kids -> JSX
typMuted = p { className: "text-muted-foreground text-sm" }
