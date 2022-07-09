import 'package:buzz/buzz.dart';
import 'package:buzz/feedbacks.dart';

import 'infra/registries.dart';
import 'utils.dart';

IBuzzBase? _buzz;

/// Instance of Modular for search binds and route.
// ignore: non_constant_identifier_names
IBuzzBase get Buzz {
  _buzz ??= BuzzBase();
  return _buzz!;
}

void cleanBuzz() {
  _buzz?.destroy();
  _buzz = null;
}

abstract class IBuzzBase {
  AppEventBus get appEvents;
  CommandEventBus get commands;
  UiEventBus get uiEvents;

  Navigator get navigator;
  FeedbacksExecutor get feedbacksExecutor;

  void init({
    required Navigator navigator,
    FeedbacksExecutor? feedbacksExecutor,
    List<ModuleBuzzRegistries>? moduleRegistries,
  });

  void fire<X extends SupportedTyped>(X event);
  void destroy();
}

class BuzzBase implements IBuzzBase {
  @override
  Navigator get navigator => _navigator;

  @override
  FeedbacksExecutor get feedbacksExecutor => _feedbacksExecutor;

  @override
  AppEventBus get appEvents => EventBusHolder.of<AppEventBus>();

  @override
  CommandEventBus get commands => EventBusHolder.of<CommandEventBus>();

  @override
  UiEventBus get uiEvents => EventBusHolder.of<UiEventBus>();

  late Navigator _navigator;
  late FeedbacksExecutor _feedbacksExecutor;
  List<ModuleBuzzRegistries>? _moduleRegistries;

  @override
  void init({
    required Navigator navigator,
    FeedbacksExecutor? feedbacksExecutor,
    List<ModuleBuzzRegistries>? moduleRegistries,
  }) {
    _navigator = navigator;
    _feedbacksExecutor = feedbacksExecutor ?? DefaultFeedbacksExecutor();
    _moduleRegistries = moduleRegistries;

    _bindNavigationCommandHandler();
    _bindRegistries();
  }

  @override
  void fire<X extends SupportedTyped>(X event) {
    print('fire $event');
    try {
      EventBusHolder.ofType<X>().fire(event);
    } catch (e) {
      buzzLog('$runtimeType $e');
    }
  }

  @override
  void destroy() {
    //TODO: implement
  }

  void _bindNavigationCommandHandler() {
    commands.on<NavigationCommand>().listen((navigationCommand) {
      NavigationCommandHandler(
        navigator: _navigator,
        backDefault: _navigator.backDefaultRoute,
      ).handle(navigationCommand);
    });
  }

  void _bindRegistries() {
    _moduleRegistries?.forEach((moduleRegistry) {
      uiEvents.bindRegistries(moduleRegistry.uiEvents);
      commands.bindRegistries(moduleRegistry.commands);
      appEvents.bindRegistries(moduleRegistry.appEvents);
    });
  }
}
