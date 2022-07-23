import 'package:buzz/buzz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_routes.dart';
import '../shared/modules/profile/data/profile_repository.dart';
import '../shared/modules/profile/module_registry.dart';
import '../shared/not_found_page.dart';
import 'home/home_module.dart';
import 'overrides/app_navigator.dart';
import 'profile/module.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => Buzz
            ..init(
              navigator: ModularAppNavigator(),
              moduleRegistries: [
                ProfileModuleRegistries(
                  () => Modular.get<IProfileRepository>(),
                ),
              ],
            ),
          export: true,
        ),
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
