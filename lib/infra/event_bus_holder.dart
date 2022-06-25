import '../event_bus_holder_impl.dart';
import '../kinds/app_events.dart';
import '../kinds/commands.dart';
import '../kinds/ui_events.dart';
import 'typed_event_bus.dart';

IEventBusHolder? _eventBusHolder;

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
  TypedEventBus forKind(dynamic type);
  void addEventBus(TypedEventBus eventBus);
  void destroy();
}

class BusNotFound extends BuzzError {
  BusNotFound(String message) : super(message);
}

abstract class BuzzError implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const BuzzError(this.message, [this.stackTrace]);

  String _returnStackTrace() =>
      stackTrace != null ? '\n${stackTrace.toString()}' : '';

  @override
  String toString() => '$runtimeType: $message${_returnStackTrace()}';
}
