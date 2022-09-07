import 'package:buzz/buzz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_routes.dart';
import '../shared/not_found_page.dart';
import 'home/home_module.dart';
import 'profile/module.dart';

class CoreModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.root,
          module: HomeModule(),
        ),
        ModuleRoute(
          AppRoutes.profileRoot,
          module: ProfileModule(),
        ),
        ChildRoute(
          EventsDashboardPage.routeName,
          child: (_, __) => const EventsDashboardPage(),
        ),
        WildcardRoute(
          child: (context, args) => const NotFoundPage(),
        ),
      ];
}
