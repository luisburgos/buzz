import 'package:buzz/buzz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:profile/profile.dart';

import '../../shared/app_routes.dart';

class ProfileRoute extends ChildRoute {
  ProfileRoute()
      : super(
          AppRoutes.profileRoot,
          child: (context, args) => ProfileScreen(
            onBackToHomePressed: () {
              Modular.get<IBuzzBase>().fire(
                NavigateBackCommand(),
              );
            },
          ),
        );
}
