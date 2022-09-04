import '../infra/buzz_event_handler.dart';

abstract class AppEvent {}

abstract class AppEventHandler<A extends AppEvent> extends BuzzEventHandler<A> {
}
