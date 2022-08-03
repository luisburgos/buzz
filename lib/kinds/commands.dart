import '../infra/typed_event_bus.dart';
import '../infra/typed_event_handler.dart';

abstract class Command {}

abstract class CommandHandler<C extends Command> extends TypedEventHandler<C> {}

class CommandEventBus<C extends Command> extends TypedEventBus<C> {}
