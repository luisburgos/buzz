import '../kinds/app_events.dart';
import '../kinds/commands.dart';
import '../kinds/ui_events.dart';
import '../utils.dart';
import 'event_bus_holder.dart';

abstract class EventBusFacade {
  void fire(dynamic event) {
    try {
      EventBusHolder.ofKind(event).fire(event);
    } catch (e) {
      developerLog('$runtimeType $e');
    }
  }
}

class DefaultEventBusFacade extends EventBusFacade {
  DefaultEventBusFacade() {
    _appEvents = EventBusHolder.of<AppEventBus>() as AppEventBus;
    _commands = EventBusHolder.of<CommandEventBus>() as CommandEventBus;
    _uiEvents = EventBusHolder.of<UIEventBus>() as UIEventBus;
  }

  AppEventBus get appEvents => _appEvents;
  CommandEventBus get commands => _commands;
  UIEventBus get uiEvents => _uiEvents;

  late AppEventBus _appEvents;
  late CommandEventBus _commands;
  late UIEventBus _uiEvents;
}
