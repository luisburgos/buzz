import '../infra/typed_event_bus.dart';
import '../infra/typed_event_handler.dart';

abstract class AppEvent {}

abstract class AppEventHandler<A extends AppEvent>
    extends TypedEventHandler<A> {}

class AppEventBus<A extends AppEvent> extends TypedEventBus<A> {}
