# Navigation

Module components:
- [NavigationCommand](#navigationcommand)
- [NavigationCommandHandler](#navigationcommandhandler)
- [NavigationEvent](#navigationevent)
- [Navigator](#navigator)

## NavigationCommand

The `NavigationCommand` is a subclass of the `Command` base class. This means that any `Command` listener or `BuzzEventHandler` concrete instance, will receive the navigation specialized event.

Available commands:
- [NavigateToCommand]()
- [NavigateBackCommand]()
- [NavigateBackToCommand]()

Go to a route:

```dart
Buzz.fire(NavigateToCommand.named('/my-route'));
```

Go back to previous route:

```dart
Buzz.fire(NavigateBackCommand());
```

## NavigationCommandHandler

The `NavigationCommandHandler` is a subclass of the `BuzzEventHandler` hook. This handler responds to `NavigationCommand` instances and is automatically configured inside the `Buzz.init` method call.

Behind the scenes the `NavigationCommandHandler` uses the concrete `Navigator` instance to actually perform navigation logic. 

> TODO: Add class diagram on NavigationCommandHandler using Navigator.

## NavigationEvent

The `NavigationEvent` is a subclass of the `AppEvent` base class. This means that any `AppEvent` listener or `BuzzEventHandler` concrete instance, will receive the navigation specialized event.

- [OnNavigatedToEvent]()
- [OnNavigatedBackEvent]()


## Navigator

The `Navigator` component lets you to add your favorite custom navigation implementation. This is a required parameter for the `Buzz.init` method.


### [Get](https://pub.dev/packages/get)

````dart
class GetAppNavigator extends Navigator {
  @override
  void back() {
    Get.back();
  }

  @override
  String get backDefaultRoute => '/';

  @override
  bool canPop() => Get.key.currentState?.canPop() ?? false;

  @override
  void offAndToNamed(String fallback) {
    Get.offAndToNamed(fallback);
  }

  @override
  void toNamed(String path) {
    Get.toNamed(path);
  }
}
````

### [Modular](https://pub.dev/packages/flutter_modular)

```dart
class ModularAppNavigator extends Navigator {
  @override
  void back() {
    Modular.to.pop();
  }

  @override
  String get backDefaultRoute => '/';

  @override
  bool canPop() => Modular.to.canPop();

  @override
  void offAndToNamed(String fallback) {
    Modular.to.navigate(fallback);
  }

  @override
  void toNamed(String path) {
    Modular.to.pushNamed(path);
  }
}
```
