import '../infra/typed_event_bus.dart';
import '../infra/typed_event_handler.dart';

abstract class AppEvent implements SupportedTyped {}

abstract class AppEventHandler extends TypedEventHandler<AppEvent> {
  void handle(AppEvent appEvent);
}

class AppEventBus extends TypedEventBus<AppEvent> {}
