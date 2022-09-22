import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../../shared/modules/trivia/page.dart';
import '../../shared/modules/trivia/play/page.dart';
import '../../shared/modules/trivia/scoreboard/page.dart';
import '../extensions/get_module.dart';

class TriviaModule extends GetModule {
  @override
  List<GetRoute> get routes => [
        TriviaRoute(),
        TriviaPlayRoute(),
        TriviaScoreboardRoute(),
      ];
}

class TriviaRoute extends GetRoute {
  TriviaRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: TriviaPage.routeName,
        page: () => TriviaPage(
          onStartPlayTap: (triviaId) {
            Buzz.fire(NavigateToTriviaPlay(triviaId: triviaId));
          },
          onSeeScoreboardTap: (triviaId) {
            Buzz.fire(NavigateToTriviaScoreboard(triviaId: triviaId));
          },
        ),
      );
}

class TriviaPlayRoute extends GetRoute {
  TriviaPlayRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: TriviaPlayPage.routeName,
        page: () => TriviaPlayPage(
          onNewTriviaGameTap: () {
            throw UnimplementedError('Must go to TriviaPlayPage');
          },
        ),
      );
}

class TriviaScoreboardRoute extends GetRoute {
  TriviaScoreboardRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: TriviaScoreboardPage.routeName,
        page: () => TriviaScoreboardPage(
          onNewTriviaGameTap: () {
            throw UnimplementedError('Must go to TriviaScoreboardPage');
          },
        ),
      );
}
