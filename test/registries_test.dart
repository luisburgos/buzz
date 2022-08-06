import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import 'fixtures/app_events.dart';

class FakeDataRepository {}

void main() {
  test('AppEventRegistry.registryType works for base class', () {
    final registry = AppEventRegistry<BaseAppEvent>(
      handler: (event) {
        print(event);
      },
    );
    expect(registry.registryType, BaseAppEvent);
  });
}
