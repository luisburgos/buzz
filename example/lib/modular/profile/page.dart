import 'package:buzz/buzz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/app_routes.dart';
import '../../shared/modules/profile/presentation/screen.dart';

class ProfileRoute extends ChildRoute {
  ProfileRoute()
      : super(
          AppRoutes.profileRoot,
          child: (context, args) => ProfileScreen(
            onBackToHomePressed: () {
              Modular.get<BuzzBase>().fire(
                NavigateBackCommand(),
              );
            },
          ),
        );
}
