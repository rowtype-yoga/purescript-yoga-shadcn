module ShadCN.Sidebar where

import Prelude
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic (JSX, ReactContext, createContext, provider)
import React.Basic.Events (handler_)
import React.Basic.Hooks as React
import ShadCN.Internal (el, mergeProps)
import Yoga.React (component)
import Yoga.React.DOM.HTML (button, div)
import Yoga.React.DOM.Internal (class IsJSX, createElement, css)

type SidebarState = { open :: Boolean, toggle :: Effect Unit }

sidebarContext :: ReactContext SidebarState
sidebarContext = unsafePerformEffect (createContext { open: true, toggle: pure unit })

sidebarProvider :: Array JSX -> JSX
sidebarProvider kids = sidebarProviderComponent { children: kids }

sidebarProviderComponent :: { children :: Array JSX } -> JSX
sidebarProviderComponent = component "SidebarProvider" \props -> React.do
  open /\ setOpen <- React.useState' true
  let toggle = setOpen (not open)
  pure $ provider sidebarContext { open, toggle }
    [ div { className: "group/sidebar-wrapper flex min-h-svh w-full", style: css { "--sidebar-width": "16rem", "--sidebar-width-icon": "3rem" } } props.children
    ]

sidebar :: Array JSX -> JSX
sidebar kids = sidebarComponent { children: kids }

sidebarComponent :: { children :: Array JSX } -> JSX
sidebarComponent = component "Sidebar" \props -> React.do
  ctx <- React.useContext sidebarContext
  let state = if ctx.open then "expanded" else "collapsed"
  pure $ div { className: "group peer text-sidebar-foreground flex h-svh w-[--sidebar-width] flex-col bg-sidebar border-r transition-[width] duration-200 data-[state=collapsed]:w-[--sidebar-width-icon]" } props.children

sidebarTrigger :: Array JSX -> JSX
sidebarTrigger kids = sidebarTriggerComponent { children: kids }

sidebarTriggerComponent :: { children :: Array JSX } -> JSX
sidebarTriggerComponent = component "SidebarTrigger" \props -> React.do
  ctx <- React.useContext sidebarContext
  pure $ button { className: "inline-flex items-center justify-center rounded-md text-sm font-medium h-7 w-7", onClick: handler_ ctx.toggle } props.children

sidebarHeader :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sidebarHeader props = createElement (el "div") (mergeProps { className: "flex flex-col gap-2 p-2" } props)

sidebarContent :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sidebarContent props = createElement (el "div") (mergeProps { className: "flex min-h-0 flex-1 flex-col gap-2 overflow-auto p-2" } props)

sidebarFooter :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sidebarFooter props = createElement (el "div") (mergeProps { className: "flex flex-col gap-2 p-2" } props)

sidebarMenu :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sidebarMenu props = createElement (el "ul") (mergeProps { className: "flex w-full min-w-0 flex-col gap-1" } props)

sidebarMenuItem :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sidebarMenuItem props = createElement (el "li") (mergeProps { className: "group/menu-item relative" } props)

sidebarMenuButton :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
sidebarMenuButton props = createElement (el "button") (mergeProps { className: "peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left text-sm outline-none ring-sidebar-ring hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 disabled:pointer-events-none disabled:opacity-50" } props)
