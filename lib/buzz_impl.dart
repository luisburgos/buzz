import 'package:event_bus/event_bus.dart';

import 'event_dashboard/buzz_registry.dart';
import 'feedbacks/buzz_registry.dart';
import 'feedbacks/feedbacks_executor.dart';
import 'navigation/buzz_registry.dart';
import 'navigation/navigator.dart';
import 'utils/utils.dart';

///ignore: non_constant_identifier_names
BuzzBase Buzz = BuzzBase();

void cleanBuzz() {
  //TODO: Evaluate remove
}

class BuzzBase extends EventBus {
  List<BuzzRegistry> registries = [];
  bool initDone = false;

  late Navigator navigator;
  FeedbacksExecutor? feedbacksExecutor;

  void init({
    required Navigator navigator,
    FeedbacksExecutor? feedbacksExecutor,
    bool withDebugDashboard = false,
    String? rootAppRoute,
    List<BuzzRegistry> initialRegistries = const [],
  }) {
    this.navigator = navigator;
    this.feedbacksExecutor = feedbacksExecutor;

    Buzz.on().listen(
      (event) => buzzLog('event fired:  ${event.runtimeType}'),
    );

    registries.addAll(initialRegistries);

    if (withDebugDashboard) {
      if (rootAppRoute == null) {
        throw ArgumentError(
          'rootAppRoute cannot be null when withDebugDashboard is true',
        );
      }

      registries.add(EventsDashboardBuzzRegistry(mainAppRoute: rootAppRoute));
    }

    registries.add(
      NavigationBuzzRegistry(
        navigator: navigator,
        backDefault: navigator.backDefaultRoute,
      ),
    );
    if (feedbacksExecutor != null) {
      registries.add(
        FeedbacksExecutorBuzzRegistry(feedbacksExecutor: feedbacksExecutor),
      );
    }

    for (var element in registries) {
      buzzLog('register: $element');
      element.register(this);
    }

    initDone = true;
  }
}

abstract class BuzzRegistry {
  void register(BuzzBase buzz);
}
