import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../fixtures/mock_feedbacks_executor.dart';

void main() {
  group('FeedbacksCommandHandler uses MockFeedbacksExecutor', () {
    final mockFeedbacksExecutor = MockFeedbacksExecutor();

    test(
      'FeedbacksExecutor.snackBar is called for ShowSnackBarCommand',
      () {
        final testFeedbacksCommandHandler = FeedbacksCommandHandler(
          feedbacksExecutor: mockFeedbacksExecutor,
        );

        testFeedbacksCommandHandler.handle(
          ShowSnackBarCommand('TITLE', message: 'MESSAGE'),
        );

        verify(mockFeedbacksExecutor.snackBar('TITLE', 'MESSAGE')).called(1);
      },
    );
  });
}
