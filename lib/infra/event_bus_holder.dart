import '../event_bus_holder_impl.dart';
import '../kinds/app_events.dart';
import '../kinds/commands.dart';
import '../kinds/ui_events.dart';
import 'typed_event_bus.dart';

IEventBusHolder? _eventBusHolder;

//ignore: non_constant_identifier_names
IEventBusHolder get EventBusHolder {
  _eventBusHolder ??= EventBusHolderImpl()
    ..addEventBus(AppEventBus())
    ..addEventBus(CommandEventBus())
    ..addEventBus(UiEventBus());
  return _eventBusHolder!;
}

void cleanEventBusHolder() {
  _eventBusHolder?.destroy();
  _eventBusHolder = null;
}

abstract class IEventBusHolder {
  X of<X extends TypedEventBus>();
  void addEventBus(TypedEventBus eventBus);
  void destroy();
  TypedEventBus forType<T>();
}
