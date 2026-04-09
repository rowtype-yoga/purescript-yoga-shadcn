module ShadCN.Toast where

import React.Basic (JSX)
import ShadCN.Internal (mergeProps)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

toastProvider :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toastProvider props = createElement Radix.toastProvider (mergeProps {} props)

toast :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toast props = createElement Radix.toastRoot (mergeProps { className: "bg-background text-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md border p-6 pr-8 shadow-lg transition-all" } props)

toastDestructive :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toastDestructive props = createElement Radix.toastRoot (mergeProps { className: "destructive bg-destructive text-destructive-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md border p-6 pr-8 shadow-lg transition-all" } props)

toastAction :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toastAction props = createElement Radix.toastAction (mergeProps { className: "hover:bg-secondary focus:ring-ring group-[.destructive]:border-muted/40 group-[.destructive]:hover:border-destructive/30 group-[.destructive]:hover:bg-destructive group-[.destructive]:hover:text-destructive-foreground group-[.destructive]:focus:ring-destructive inline-flex h-8 shrink-0 items-center justify-center rounded-md border bg-transparent px-3 text-sm font-medium transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:pointer-events-none disabled:opacity-50", altText: "action" } props)

toastClose :: forall r. { | r } -> JSX
toastClose props = createElement Radix.toastClose (mergeProps { className: "text-foreground/50 hover:text-foreground absolute top-2 right-2 rounded-md p-1 opacity-0 transition-opacity focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" } props) ([] :: Array JSX)

toastTitle :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toastTitle props = createElement Radix.toastTitle (mergeProps { className: "text-sm font-semibold" } props)

toastDescription :: forall r kids. IsJSX kids => { | r } -> kids -> JSX
toastDescription props = createElement Radix.toastDescription (mergeProps { className: "text-sm opacity-90" } props)

toastViewport :: forall r. { | r } -> JSX
toastViewport props = createElement Radix.toastViewport (mergeProps { className: "fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]" } props) ([] :: Array JSX)
