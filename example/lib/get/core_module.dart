import 'package:buzz/buzz.dart';
import 'package:example/shared/app_routes.dart';
import 'package:get/get.dart';

import 'extensions/get_module.dart';
import 'modules/home_module.dart';
import 'modules/join_module.dart';
import 'modules/new_trivia_module.dart';
import 'modules/profile_module.dart';
import 'modules/trivia_module.dart';

class CoreModule extends GetModule {
  @override
  List<GetBind> get binds => [];

  @override
  List<GetRoute> get routes => [
        GetModuleRoute(
          module: HomeModule(
            newTriviaRoute: AppRoutes.newTrivia,
          ),
        ),
        GetModuleRoute(
          module: NewTriviaModule(),
        ),
        GetModuleRoute(
          module: TriviaModule(),
        ),
        GetModuleRoute(
          module: JoinModule(),
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
