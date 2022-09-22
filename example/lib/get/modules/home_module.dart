import 'package:buzz/buzz.dart';
import 'package:example/shared/modules/trivia/new/page.dart';
import 'package:get/get.dart';

import '../../shared/modules/home/page.dart';
import '../extensions/get_module.dart';

class HomeModule extends GetModule {
  final String newTriviaRoute;

  HomeModule({
    required this.newTriviaRoute,
  });

  @override
  List<GetRoute> get routes => [
        HomeRoute(newTriviaRoute),
      ];
}

class HomeRoute extends GetRoute {
  HomeRoute(this.newTriviaRoute);

  final String newTriviaRoute;

  @override
  GetPage get asGetPage => GetPage(
        name: HomePage.routeName,
        page: () => HomePage(
          onNewTriviaGameTap: () {
            Buzz.fire(NavigateToNewTrivia());
          },
          onGoToBuzzTap: () {
            Buzz.fire(
              GoToBuzzEventsDashboard(),
            );
          },
        ),
      );
}
