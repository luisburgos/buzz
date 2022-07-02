import 'package:get/get.dart';

abstract class GetModule {
  List<GetRoute> get routes => const [];
  List<GetBind> get binds => const [];

  void runBinds() {
    for (var bind in binds) {
      bind.builder();
    }

    /// Nested modules binds
    for (var route in routes) {
      if (route is GetModuleRoute) {
        route.module.runBinds();
      }
    }
  }

  List<GetPage> buildPages() {
    List<GetPage> pages = [];
    for (var route in routes) {
      if (route is GetModuleRoute) {
        pages.addAll(route.module.buildPages());
      }

      final page = route.asGetPage;
      if (page != null) {
        pages.add(page);
      }
    }
    return pages;
  }
}

class GetBind {
  GetBind(this.builder);
  final Function() builder;
}

class GetRoute {
  GetPage? get asGetPage => null;
}

class GetModuleRoute extends GetRoute {
  GetModuleRoute({
    required this.module,
  });

  final GetModule module;
}
