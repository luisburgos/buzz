import 'package:buzz/buzz.dart';
import 'package:flutter/foundation.dart';

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
    List<BuzzEventHandlersRegistries>? registries,
  });

  void fire(dynamic message);
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

  @visibleForTesting
  List<BuzzEventHandlersRegistries>? eventHandlersRegistries;

  @visibleForTesting
  bool initDone = false;

  @override
  void init({
    required Navigator navigator,
    FeedbacksExecutor? feedbacksExecutor,
    List<BuzzEventHandlersRegistries>? registries,
  }) {
    _navigator = navigator;
    _feedbacksExecutor = feedbacksExecutor ?? DefaultFeedbacksExecutor();
    eventHandlersRegistries = registries;

    _bindNavigationCommandHandler();
    _bindFeedbacksCommandHandler();
    _bindRegistries();

    initDone = true;
  }

  @override
  void fire(dynamic message) {
    if (message is UiEvent) {
      uiEvents.fire(message);
    } else if (message is AppEvent) {
      appEvents.fire(message);
    } else if (message is Command) {
      commands.fire(message);
    } else {
      throw UnsupportedBuzzMessageType(message);
    }
  }

  @override
  void destroy() {
    initDone = false;
    //TODO: Could add finishModule() callback;
  }

  void _bindNavigationCommandHandler() {
    commands.on<NavigationCommand>().listen((command) {
      NavigationCommandHandler(
        navigator: _navigator,
      ).handle(command);
    });
  }

  void _bindFeedbacksCommandHandler() {
    commands.on<FeedbacksCommand>().listen((command) {
      FeedbacksCommandHandler(
        feedbacksExecutor: _feedbacksExecutor,
      ).handle(command);
    });
  }

  void _bindRegistries() {
    eventHandlersRegistries?.forEach((eventHandlerRegistry) async {
      await uiEvents.bindRegistries(eventHandlerRegistry.uiEvents);
      await commands.bindRegistries(eventHandlerRegistry.commands);
      await appEvents.bindRegistries(eventHandlerRegistry.appEvents);
    });
  }
}
