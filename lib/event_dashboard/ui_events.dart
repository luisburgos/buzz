import '../buzz.dart';

class GoToDashboardPageUiEvent extends UiEvent {
  GoToDashboardPageUiEvent(this.route);
  final String? route;

  @override
  String toString() => '$runtimeType - route: $route';
}

class GoToAppTappedUiEvent extends UiEvent {}
