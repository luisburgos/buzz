import 'package:buzz/buzz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_routes.dart';
import '../shared/modules/profile/profile_page.dart';

class ProfileModule extends Module {
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
          ),
        ),
      ];
}
