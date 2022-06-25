import '../infra/typed_event_bus.dart';

abstract class AppEvent {}

abstract class AppEventHandler extends TypedEventHandler<AppEvent> {
  void handle(AppEvent appEvent);
}

class AppEventBus extends TypedEventBus<AppEvent> {
  @override
  bool isTypeSupported(dynamic type) {
    return type is AppEvent;
  }
}
