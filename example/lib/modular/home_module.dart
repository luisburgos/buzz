import 'package:buzz/buzz.dart';
import 'package:example/shared/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_routes.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.root,
          child: (context, args) => HomePage(
            onGoToProfilePressed: () {
              Modular.get<IBuzzBase>().fire(
                NavigateToCommand.named(AppRoutes.profileRoot),
              );
            },
          ),
        ),
      ];
}
