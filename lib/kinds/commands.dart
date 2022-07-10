import '../infra/typed_event_bus.dart';
import '../infra/typed_event_handler.dart';

abstract class Command {}

abstract class CommandHandler extends TypedEventHandler<Command> {}

class CommandEventBus extends TypedEventBus<Command> {}
