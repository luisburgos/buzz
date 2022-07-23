# Navigator

The `Navigator` component lets you to add your favorite custom navigation implementation. This is a
required parameter for the `Buzz.init` method.

### NavigationCommandHandler

Behind the scenes the `NavigationCommandHandler` uses the concrete `Navigator` instance to 
actually perform navigation logic. 

The `NavigationCommandHandler` responds to `NavigationCommand` instances and is automatically 
configured inside the `Buzz.init` method call.

### NavigationCommand

The `NavigationCommand` is a subclass of the `Command` base class. So is listen and handled by
the `CommandEventBus`.

### Examples

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

or

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
