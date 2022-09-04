import '../../buzz.dart';
import '../ui_events.dart';

void defaultGoTo(String? route) {
  Buzz.fire(GoToDashboardPageUiEvent(route));
}

void defaultGoToAppTapped() {
  Buzz.fire(GoToAppTappedUiEvent());
}
