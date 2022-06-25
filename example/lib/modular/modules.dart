import 'package:buzz/buzz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_routes.dart';
import '../shared/not_found_page.dart';
import 'home_module.dart';
import 'modular_app_navigator.dart';
import 'profile_module.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => Buzz
            ..init(
              navigator: ModularAppNavigator(),
            ),
          export: true,
        ),
      ];
}

class ModularAppRootModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

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
        WildcardRoute(
          child: (context, args) => const NotFoundPage(),
        ),
      ];
}
