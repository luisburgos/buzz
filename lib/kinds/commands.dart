import '../infra/buzz_event_handler.dart';

abstract class Command {}

abstract class CommandHandler<C extends Command> extends BuzzEventHandler<C> {}
