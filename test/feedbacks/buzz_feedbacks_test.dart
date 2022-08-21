import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

import '../fixtures/test_helper.dart';

void main() {
  group('ShowSnackBarCommand', () {
    buzzTestEmitsInOrder(
      'emits OnShowedSnackBarEvent',
      given: () async {
        initDefaultTestBuzz();
      },
      expectCommandsMatchers: () => [
        predicate<ShowSnackBarCommand>((command) {
          expect(command.title, 'TITLE');
          expect(command.message, 'MESSAGE');
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        isA<OnShowedSnackBarEvent>(),
      ],
      fire: () => [
        ShowSnackBarCommand('TITLE', message: 'MESSAGE'),
      ],
    );

    buzzTestEmitsInOrder(
      'emits OnShowedSnackBarEvent using DefaultFeedbacksExecutor',
      given: () async {
        initDefaultTestBuzz(
          feedbacksExecutor: DefaultFeedbacksExecutor(),
        );
      },
      expectCommandsMatchers: () => [
        predicate<ShowSnackBarCommand>((command) {
          expect(command.title, 'TITLE');
          expect(command.message, 'MESSAGE');
          return true;
        }),
      ],
      expectAppEventsMatchers: () => [
        isA<OnShowedSnackBarEvent>(),
      ],
      fire: () => [
        ShowSnackBarCommand('TITLE', message: 'MESSAGE'),
      ],
    );
  });
}
