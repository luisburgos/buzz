# Event Buses

The main opinion of this framework is using an `EventBus` for different types of events. Imagine
the `EventBus` being like a river which we can use to deliver messages, is a communication channel. 

But these rivers has some special characteristics:
- The messages we can deliver are called `Events`.
- The could listen to those events through a `TypedEventHandler` component.

The rivers proposed by this framework are:
- The `UIEvent` river, called `UIEventBus`.
- The `Command` river, called `CommandEventBus`.
- The `AppEvent` river, called `AppEventBus`.

## UIEventBus

> An `UIEvent` is defined as any User Interaction, it MUST be named behind user interface components. 

This bus lets you fire/listen event of type `UIEvent`.

## CommandEventBus

> An `Command` is defined as requests to execute Business Logic.

This bus lets you fire/listen event of type `Command`.

## AppEventBus

> An `AppEvent` is defined as results from the execution of Business Logic code.

This bus lets you fire/listen event of type `AppEvent`.

## TypedEventHandler

TODO: Add docs about generic component and the NavigationCommandHandler.
