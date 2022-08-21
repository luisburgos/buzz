import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import '../fixtures/non_supported_events.dart';

void main() {
  group('BuzzError quick exceptions', () {
    test(
      'BuzzTypedEventBusForTypeNotFound.toString()',
      () {
        final error = BuzzTypedEventBusForTypeNotFound('NonSupportedClass');
        expect(
          error.toString(),
          'EventBus for NonSupportedClass not found',
        );
      },
    );

    test(
      'UnsupportedBuzzMessageType.toString()',
      () {
        final error = UnsupportedBuzzMessageType(NonSupportedClass);
        expect(error.toString(), 'NonSupportedClass type is not supported');
      },
    );
  });

  group('BuzzError exceptions with StackTrace', () {
    test(
      'BuzzTypedEventBusForTypeNotFound.toString()',
      () {
        final error = BuzzTypedEventBusForTypeNotFound(
          'NonSupportedClass',
          StackTrace.fromString('Fake stake trace'),
        );
        expect(
          error.toString(),
          'EventBus for NonSupportedClass not found\n'
          'Fake stake trace',
        );
      },
    );

    test(
      'UnsupportedBuzzMessageType.toString() with StackTrace',
      () {
        final error = UnsupportedBuzzMessageType(
          NonSupportedClass,
          StackTrace.fromString('Fake stake trace'),
        );
        expect(
          error.toString(),
          'NonSupportedClass type is not supported\n'
          'Fake stake trace',
        );
      },
    );
  });
}
