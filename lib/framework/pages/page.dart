class BuzzPage {
  String? name;
  //TODO: Add Page Parameters
  PageRouteSettings? routeSettings = PageRouteSettings();
  PageScaffold scaffold = PageScaffold();

  void setRoute(String route) {
    routeSettings?.route = route;
  }

  void setShowOnNavBar(bool showOnNavBar) {
    scaffold.navBarItemProperties.showOnNaBar = showOnNavBar;
  }

  void setAlwaysShowNavBarOnPage(bool alwaysShowNavBarOnPage) {
    scaffold.navBarItemProperties.alwaysShowNavBarOnPage =
        alwaysShowNavBarOnPage;
  }
}

class PageRouteSettings {
  String? route;
}

class PageScaffold {
  PageScaffoldProperties scaffoldProperties = PageScaffoldProperties();
  NavBarItemProperties navBarItemProperties = NavBarItemProperties();
}

class PageScaffoldProperties {
  bool safeArea = true;
  bool hideKeyboardOnTap = true;
}

class NavBarItemProperties {
  bool showOnNaBar = false;
  bool alwaysShowNavBarOnPage = false;
}
