import 'package:buzz/buzz.dart';
import 'package:test/test.dart';

void main() {
  group('OnTapped', () {
    test('', () {
      final onTapped = OnTapped(data: 'data');
      expect(onTapped.data, 'data');
    });
  });

  group('OnScroll', () {
    test('OnScrollDirection.up', () {
      final onScrollUp = OnScroll(
        direction: OnScrollDirection.up,
      );
      expect(onScrollUp.direction, OnScrollDirection.up);
    });

    test('OnScrollDirection.down', () {
      final onScrollDown = OnScroll(
        direction: OnScrollDirection.down,
      );
      expect(
        onScrollDown.direction,
        OnScrollDirection.down,
      );
    });
  });

  group('OnSwipe', () {
    test('OnSwipeDirection.left', () {
      final onSwipeLeft = OnSwipe(
        direction: OnSwipeDirection.left,
      );
      expect(onSwipeLeft.direction, OnSwipeDirection.left);
    });

    test('OnSwipeDirection.right', () {
      final onSwipeRight = OnSwipe(
        direction: OnSwipeDirection.right,
      );
      expect(onSwipeRight.direction, OnSwipeDirection.right);
    });
  });

  group('OnToggleChanged', () {
    test('is enabled', () {
      final onToggleChanged = OnToggleChanged(isEnabled: true);
      expect(onToggleChanged.isEnabled, true);
      expect(onToggleChanged.isDisabled, false);
    });

    test('is disabled', () {
      final onToggleChanged = OnToggleChanged(isEnabled: false);
      expect(onToggleChanged.isEnabled, false);
      expect(onToggleChanged.isDisabled, true);
    });
  });

  group('OnFocusChanged', () {
    test('has the focus', () {
      final onFocusChanged = OnFocusChanged(hasFocus: true);
      expect(onFocusChanged.hasFocus, true);
    });

    test('has NOT the focus', () {
      final onFocusChanged = OnFocusChanged(hasFocus: false);
      expect(onFocusChanged.hasFocus, false);
    });
  });
}
