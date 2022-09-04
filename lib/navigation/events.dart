import '../buzz.dart';

abstract class NavigationEvent extends AppEvent {}

class OnNavigatedToEvent extends NavigationEvent {
  OnNavigatedToEvent(this.path);

  final String path;

  @override
  String toString() {
    return '$runtimeType path: $path';
  }
}

class OnNavigatedBackEvent extends NavigationEvent {
  OnNavigatedBackEvent({
    this.fallbackPath,
  });

  final String? fallbackPath;

  @override
  String toString() {
    return '$runtimeType fallbackPath: $fallbackPath';
  }
}
