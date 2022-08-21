import 'package:buzz/navigation/navigator.dart';
import 'package:mockito/mockito.dart';

class MockNavigator extends Mock implements Navigator {
  @override
  String get backDefaultRoute => super.noSuchMethod(
        Invocation.method(#backDefaultRoute, []),
        returnValue: '/',
        returnValueForMissingStub: '/',
      );

  @override
  bool canPop() => super.noSuchMethod(
        Invocation.method(#canPop, []),
        returnValue: true,
        returnValueForMissingStub: true,
      );

  @override
  void back() => super.noSuchMethod(
        Invocation.method(#back, []),
        returnValue: null,
        returnValueForMissingStub: null,
      );

  @override
  void toNamed(String path) => super.noSuchMethod(
        Invocation.method(#send, [path]),
        returnValue: path,
        returnValueForMissingStub: '/',
      );
}
