import 'package:buzz/buzz.dart';
import 'package:mockito/mockito.dart';

class MockFeedbacksExecutor extends Mock implements FeedbacksExecutor {
  @override
  void snackBar(String title, String message) => super.noSuchMethod(
        Invocation.method(#snackBar, [title, message]),
        returnValue: null,
        returnValueForMissingStub: null,
      );
}
