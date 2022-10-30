import 'package:buzz/framework/pages/page.dart';
import 'package:test/test.dart';

void main() {
  group('BuzzPage', () {
    test('default', () {
      //When
      final page = BuzzPage();
      page.name = 'HomePage';
      page.setRoute('/home');

      //Then
      expect(page.name, 'HomePage');
      expect(page.routeSettings?.route, '/home');
      expect(page.scaffold.scaffoldProperties.hideKeyboardOnTap, true);
      expect(page.scaffold.scaffoldProperties.safeArea, true);
      expect(page.scaffold.navBarItemProperties.showOnNaBar, false);
      expect(page.scaffold.navBarItemProperties.alwaysShowNavBarOnPage, false);
    });

    test('update navBarItemProperties', () {
      //When
      final page = BuzzPage();
      page.name = 'HomePage';
      page.setRoute('/home');
      page.setAlwaysShowNavBarOnPage(true);
      page.setShowOnNavBar(true);

      //Then
      expect(page.name, 'HomePage');
      expect(page.routeSettings?.route, '/home');
      expect(page.scaffold.scaffoldProperties.hideKeyboardOnTap, true);
      expect(page.scaffold.scaffoldProperties.safeArea, true);
      expect(page.scaffold.navBarItemProperties.showOnNaBar, true);
      expect(page.scaffold.navBarItemProperties.alwaysShowNavBarOnPage, true);
    });
  });
}
