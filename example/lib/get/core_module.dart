import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import 'extensions/get_module.dart';
import 'home/module.dart';
import 'profile/module.dart';

class CoreModule extends GetModule {
  @override
  List<GetBind> get binds => [];

  @override
  List<GetRoute> get routes => [
        GetModuleRoute(
          module: HomeModule(),
        ),
        GetModuleRoute(
          module: ProfileModule(),
        ),
        BuzzDashboardGetRoute(),
      ];
}

class BuzzDashboardGetRoute extends GetRoute {
  @override
  GetPage? get asGetPage => GetPage(
        name: EventsDashboardPage.routeName,
        page: () => const EventsDashboardPage(),
      );
}
