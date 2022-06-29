# Example

# Architecture Components

## Overview

- `UiComponent` lives inside a `ViewTemplate`
- A `ViewTemplate` exposes `Callbacks`, `ViewBuilders`, `Configs` and `attributes`
    - A `Callback`
- A`View` use a `ViewTemplate`
- A `Page`uses a `ViewTemplate` to bind the `StateHolder`, examples are `ViewController` or `ViewModel`
- A `StateHolder` 
  - Listens to data streams from `Repositories` in a read-only mode
  - Exposes processed and filtered information for the `Page` to inject into the `View`.
  - Could listen to `AppEvents` and request more `Commands` execution. For example using the `NavigationCommand` or the `FeedbackCommand` should be common here.
- A `StateHolder` transform `UiEvents` (user interactions requesting something to our app) to `UseCase` execution requests.
- A `UseCaseCommand` or `Command` represents the message to request business logic execution to start. 
- A `CommandHandler` is the executioner of the business logic. 
  - It has access to `Repositories` to call WRITE async methods and wait for results to update all
  the `DataProviders` supported by the `Repository`. For example, update local cache strategies or calling API services (which could be different if the use case requires it).
  - A `CommandHandler` emits `AppEvents` which can be listen by `StateHolders`.
  - **Q:** Should the `CommandHandler` orchestrate saving data to a cache? Or should this be taken care by the `Repository`. Maybe the `Repository` is our champion approach.
- A `Repository` is a facade for `DataProviders` or `DataSources`. 
  - The `Repository` handles data providers administration.
  - `SmartReposities` also handles `Cache`, `Schedulers`, `Queues` implementations to provide more complex logic for data access.

**TODO:**

- [ ] Change Page to Screen?
- [ ] Find a way to justify having Page -> View (ViewTemplate + StateHolder) maybe eventually Page = View + PageController where the controller can access to feature flags. 

---
From Atomic Design guides:
- ViewTemplate consist mostly of groups of UiComponent stitched together to form pages. 
- Pages are specific instances of templates

## Presentation


## Domain

- `UseCaseCommand`
    - Generated from a `StateHolder` component
- `UseCaseCommandHandler`
    - Fires `AppEvents`

## Data

## Architecture Components Checklist

### Base Files

- I have a `template.dart`
- I have a `view.dart`
- I have a `screen.dart` or `page.dart`
- I have a `routes.dart`

### Nested Features

- A `feature` has its own folder with the name of the feature. Following dart packages conventions.
- A `feature` folder uses the same naming convention of the section #base-files
