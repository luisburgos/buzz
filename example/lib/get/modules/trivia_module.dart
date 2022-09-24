import 'package:buzz/buzz.dart';
import 'package:example/shared/app_routes.dart';
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
        name: AppRoutes.trivia,
        page: () => const TriviaPage(),
      );
}

class CopyToClipBoardCommand extends Command {
  CopyToClipBoardCommand(this.content);

  final String content;
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
