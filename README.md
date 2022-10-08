# Buzz

Opinionated modern event-based application development framework. 

Built on top of [dart-event-bus](https://github.com/marcojakob/dart-event-bus).

## Installation

```yaml
buzz: 0.1.0
```

## Initialization

```dart
Buzz.init(
  navigator: MyAppNavigator(),
  rootAppRoute: '/',
);
```

Learn more how to create the required instance of the [Navigator](docs/NAVIGATION.md) component.

## Fire Events

By default the framework supports firing three base class events: 
- `UiEvent`
- `Command`
  - `NavigationCommand`
- `AppEvent`

Find pre-defined [out-of-the-box supported events here](docs/EVENTS.md).

### UiEvents

The library comes with a few pre-defined `UiEvents` you can find [here](docs/EVENTS.md).

For example, when a button/label is tapped:

```dart
ElevatedButton(
  onPressed: () {
    Buzz.fire(OnTapped());
  },
  child: Text('Tap me!'),
)
```

### Commands

> TODO: Add

### AppEvents

> TODO: Add

## Listen Events

Use the `on` method from the `Buzz` instance to get a `Stream` to listen events of a specific class type.

Here is how you can add a listener for `NavigationCommand`'s:

```dart
Buzz.on<NavigationCommand>().listen((navigationCommand) {
  //TODO: Implement navigation command handler
  print(navigationCommand);
});
```

## Customization

### Include the Buzz events dashboard

First enable the `withDebugDashboard` flag from the `init` method:

```dart
Buzz.init(
  withDebugDashboard: true,
  navigator: MyAppNavigator(),
  rootAppRoute: '/',
);
```

Now you can use the `EventsDashboardPage` widget. Here is an example on how to declare a route when using [Get](https://pub.dev/packages/get):

```dart
GetPage(
  name: EventsDashboardPage.routeName,
  page: () => const EventsDashboardPage(),
  transition: Transition.fadeIn,
),
```

Finally, navigate to the events dashboard by running:

```dart
Buzz.fire(GoToBuzzEventsDashboard());
```

or add a custom button that fires the UiEvent already setup during library initialization:

```dart
Buzz.fire(GoToBuzzDashboardButtonTapped());
```


## Upcoming Features

- Default navigator using Flutter Navigator 2.0 instead of Get.

## Test Coverage

```bash
brew install lcov
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```
