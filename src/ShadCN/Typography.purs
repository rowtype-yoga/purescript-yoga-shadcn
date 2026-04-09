module ShadCN.Typography where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.HTML (blockquote, code, div, h1, h2, h3, h4, p, small, ul)
import Yoga.React.DOM.Internal (class IsJSX)

typH1 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH1 props = h1 (mergeProps { className: "scroll-m-20 text-center text-4xl font-extrabold tracking-tight text-balance" } props)

typH2 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH2 props = h2 (mergeProps { className: "scroll-m-20 border-b pb-2 text-3xl font-semibold tracking-tight first:mt-0" } props)

typH3 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH3 props = h3 (mergeProps { className: "scroll-m-20 text-2xl font-semibold tracking-tight" } props)

typH4 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH4 props = h4 (mergeProps { className: "scroll-m-20 text-xl font-semibold tracking-tight" } props)

typP :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typP props = p (mergeProps { className: "leading-7 [&:not(:first-child)]:mt-6" } props)

typBlockquote :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typBlockquote props = blockquote (mergeProps { className: "mt-6 border-l-2 pl-6 italic" } props)

typList :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typList props = ul (mergeProps { className: "my-6 ml-6 list-disc [&>li]:mt-2" } props)

typInlineCode :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typInlineCode props = code (mergeProps { className: "bg-muted relative rounded px-[0.3rem] py-[0.2rem] font-mono text-sm font-semibold" } props)

typLead :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typLead props = p (mergeProps { className: "text-muted-foreground text-xl" } props)

typLarge :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typLarge props = div (mergeProps { className: "text-lg font-semibold" } props)

typSmall :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typSmall props = small (mergeProps { className: "text-sm leading-none font-medium" } props)

typMuted :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typMuted props = p (mergeProps { className: "text-muted-foreground text-sm" } props)
