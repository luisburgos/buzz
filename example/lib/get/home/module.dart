import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../../shared/modules/home/page.dart';
import '../extensions/get_module.dart';

class HomeModule extends GetModule {
  final String profileRoute;

  HomeModule({
    required this.profileRoute,
  });

  @override
  List<GetRoute> get routes => [
        HomeRoute(profileRoute),
      ];
}

class HomeRoute extends GetRoute {
  HomeRoute(this.profileRoute);

  final String profileRoute;

  @override
  GetPage get asGetPage => GetPage(
        name: HomePage.routeName,
        page: () => HomePage(
          onNewTriviaGameTap: () {
            Buzz.fire(
              NavigateToCommand.named(profileRoute),
            );
          },
          onGoToBuzzTap: () {
            Buzz.fire(
              GoToBuzzEventsDashboard(),
            );
          },
        ),
      );
}
