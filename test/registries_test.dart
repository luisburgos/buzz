import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

class BaseAppEvent extends AppEvent {}

void main() {
  test('AppEventRegistry.registryType works for base class', () {
    final appEventRegistry = AppEventRegistry<BaseAppEvent>(
      handler: (event) {
        print(event);
      },
    );
    expect(appEventRegistry.registryType, BaseAppEvent);
  });
}
