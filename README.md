# Buzz

Opinionated modern event based application development framework. 

## Documentation

- Learn more about the pre-defined [EventBuses and Events](doc/EVENT_BUSES.md).
- Learn more how to create the required instance of the [Navigator](doc/NAVIGATOR.md) component.

## Features

- UIEvents
- Commands
  - Navigation
- AppEvents

### Upcoming

- Default navigator using Flutter Navigator 2.0.
- Support adding custom TypedEventHandlers and EventBuses.

## Installation

```yaml
buzz:
    git:
      url: git@github.com:LuisBurgos/buzz.git
      ref: main
```

## Initialization

```dart
Buzz..init(
  navigator: MyAppNavigator(),
);
```

## Fire Events

By default the framework supports firing three base class events: 
- `UiEvent`
- `Command`
- `AppEvent`

Find pre-defined [out-of-the-box supported events](doc/EVENTS.md).

### UiEvents

The library comes with a few pre-defined `UiEvents` you can find [here](doc/EVENTS.md).

For example, when a button/label is tapped:

```dart
ElevatedButton(
  onPressed: () {
    Buzz.fire(OnTapped());
  },
  child: Text('Tap me!'),
)
```

### NavigationCommands

The library comes with a few pre-defined `NavigationCommands` you can find [here](doc/EVENTS.md).

Go to a route:

```dart
Buzz.fire(
  NavigateToCommand.named('/my-route'),
);
```

or go back to previous route:

```dart
Buzz.fire(NavigateBackCommand());
```

## Listen Events

Use the `on` method from the `TypedEventBus` component to get a `Stream` to listen events of a specific class type.

For example, here is how we setup the listener for `NavigationCommands` as part of the features ready for you to use, this happens behind the insides:

```dart
final commandBus = EventBusHolder.of<CommandEventBus>();
final navigationCommandStream = commandBus.on<NavigationCommand>();
navigationCommandStream.listen((navigationCommand) {
  NavigationCommandHandler(
    navigator: _navigator,
    backDefault: _navigator.backDefaultRoute,
  ).handle(navigationCommand);
});
```

## Test Coverage

```bash
brew install lcov
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```
