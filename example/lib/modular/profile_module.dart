import 'package:buzz/buzz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:profile/profile.dart';

import '../shared/app_routes.dart';

class ProfileModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ProfileRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.profileRoot,
          child: (context, args) => ProfilePage(
            onBackToHomePressed: () {
              Modular.get<IBuzzBase>().fire(
                NavigateBackCommand(),
              );
            },
            profileStream:
                Modular.get<IProfileRepository>().profileStateChanges,
          ),
        ),
      ];
}
