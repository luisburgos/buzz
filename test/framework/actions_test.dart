import 'package:buzz/framework/actions/action.dart';
import 'package:buzz/framework/pages/page.dart';
import 'package:test/test.dart';

void main() {
  group('NavigationActionDetails', () {
    test('NavigateTo', () {
      //When
      final page = BuzzPage();
      page.name = 'HomePage';
      page.setRoute('/home');

      final navigateTo = NavigateTo();
      navigateTo.page = page;

      //Then
      expect(navigateTo.page?.name, 'HomePage');
      expect(navigateTo.page?.routeSettings?.route, '/home');
    });
  });
}
