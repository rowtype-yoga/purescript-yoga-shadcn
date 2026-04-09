module ShadCN.NavigationMenu where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

navigationMenu :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
navigationMenu props = createElement Radix.navigationMenuRoot (mergeProps { className: "relative flex max-w-max flex-1 items-center justify-center" } props)

navigationMenuList :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
navigationMenuList props = createElement Radix.navigationMenuList (mergeProps { className: "group flex flex-1 list-none items-center justify-center gap-1" } props)

navigationMenuItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
navigationMenuItem props = createElement Radix.navigationMenuItem (mergeProps {} props)

navigationMenuTrigger :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
navigationMenuTrigger props = createElement Radix.navigationMenuTrigger (mergeProps { className: "group inline-flex h-9 w-max items-center justify-center rounded-md bg-background px-4 py-2 text-sm font-medium hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground focus:outline-none disabled:pointer-events-none disabled:opacity-50" } props)

navigationMenuContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
navigationMenuContent props = createElement Radix.navigationMenuContent (mergeProps { className: "left-0 top-0 w-full md:absolute md:w-auto" } props)

navigationMenuLink :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
navigationMenuLink props = createElement Radix.navigationMenuLink (mergeProps { className: "block select-none rounded-md p-3 text-sm leading-none no-underline outline-none transition-colors hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground" } props)
