import '../infra/typed_event_bus.dart';
import '../infra/typed_event_handler.dart';

abstract class UiEvent {}

abstract class UiEventHandler<U extends UiEvent> extends TypedEventHandler<U> {}

class UiEventBus extends TypedEventBus<UiEvent> {}

class OnTapped extends UiEvent {
  OnTapped({
    this.data,
  });

  final dynamic data;
}

enum OnScrollDirection {
  up,
  down,
}

class OnScroll extends UiEvent {
  OnScroll({
    required this.direction,
  });

  final OnScrollDirection direction;
}

enum OnSwipeDirection {
  left,
  right,
}

class OnSwipe extends UiEvent {
  OnSwipe({
    required this.direction,
  });

  final OnSwipeDirection direction;
}

class OnToggleChanged extends UiEvent {
  OnToggleChanged({
    required this.isEnabled,
  });

  final bool isEnabled;

  bool get isDisabled => !isEnabled;
}

class OnFocusChanged extends UiEvent {
  OnFocusChanged({
    required this.hasFocus,
  });

  final bool hasFocus;
}

class OnValueChanged extends UiEvent {}

class OnValuePasted extends UiEvent {}

class OnValueCopied extends UiEvent {}
