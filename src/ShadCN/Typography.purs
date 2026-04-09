module ShadCN.Typography where

import Prelude hiding (div)

import React.Basic (JSX)
import ShadCN.Internal (el, mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

typH1 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH1 props = createElement (el "h1") (mergeProps { className: "scroll-m-20 text-center text-4xl font-extrabold tracking-tight text-balance" } props)

typH2 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH2 props = createElement (el "h2") (mergeProps { className: "scroll-m-20 border-b pb-2 text-3xl font-semibold tracking-tight first:mt-0" } props)

typH3 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH3 props = createElement (el "h3") (mergeProps { className: "scroll-m-20 text-2xl font-semibold tracking-tight" } props)

typH4 :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typH4 props = createElement (el "h4") (mergeProps { className: "scroll-m-20 text-xl font-semibold tracking-tight" } props)

typP :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typP props = createElement (el "p") (mergeProps { className: "leading-7 [&:not(:first-child)]:mt-6" } props)

typBlockquote :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typBlockquote props = createElement (el "blockquote") (mergeProps { className: "mt-6 border-l-2 pl-6 italic" } props)

typList :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typList props = createElement (el "ul") (mergeProps { className: "my-6 ml-6 list-disc [&>li]:mt-2" } props)

typInlineCode :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typInlineCode props = createElement (el "code") (mergeProps { className: "bg-muted relative rounded px-[0.3rem] py-[0.2rem] font-mono text-sm font-semibold" } props)

typLead :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typLead props = createElement (el "p") (mergeProps { className: "text-muted-foreground text-xl" } props)

typLarge :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typLarge props = createElement (el "div") (mergeProps { className: "text-lg font-semibold" } props)

typSmall :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typSmall props = createElement (el "small") (mergeProps { className: "text-sm leading-none font-medium" } props)

typMuted :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
typMuted props = createElement (el "p") (mergeProps { className: "text-muted-foreground text-sm" } props)
