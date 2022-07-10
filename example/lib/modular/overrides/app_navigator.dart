// ignore: unused_shown_name
import 'package:buzz/buzz.dart' show Navigator, FeedbacksExecutor;
import 'package:flutter_modular/flutter_modular.dart';

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
    /// FIXME:
    /// Using Modular.to.popAndPushNamed(routeName) results in weird
    /// behaviors when using the browser back button.
    Modular.to.navigate(fallback);
  }

  @override
  void toNamed(String path) {
    Modular.to.pushNamed(path);
  }
}
