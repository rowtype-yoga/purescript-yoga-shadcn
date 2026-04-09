module ShadCN.Tabs where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

tabs :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
tabs defaultValue props = createElement Radix.tabsRoot (mergeProps { className: "flex gap-2 flex-col", defaultValue } props)

tabsList :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
tabsList props = createElement Radix.tabsList (mergeProps { className: "bg-muted text-muted-foreground inline-flex w-fit items-center justify-center rounded-lg p-[3px] h-9" } props)

tabsTrigger :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
tabsTrigger value props = createElement Radix.tabsTrigger (mergeProps { className: "text-foreground/60 hover:text-foreground dark:text-muted-foreground inline-flex h-[calc(100%-1px)] flex-1 items-center justify-center gap-1.5 rounded-md border border-transparent px-2 py-1 text-sm font-medium whitespace-nowrap transition-all focus-visible:ring-[3px] disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm", value } props)

tabsContent :: forall r kids. IsJSX kids => String -> { | r } -> kids -> JSX
tabsContent value props = createElement Radix.tabsContent (mergeProps { className: "flex-1 outline-none", value } props)
