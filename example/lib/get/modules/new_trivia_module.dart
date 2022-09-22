import 'package:buzz/buzz.dart';
import 'package:example/shared/modules/trivia/page.dart';
import 'package:get/get.dart';

import '../../shared/modules/new_trivia/page.dart';
import '../extensions/get_module.dart';

class NewTriviaModule extends GetModule {
  @override
  List<GetRoute> get routes => [
        NewTriviaRoute(),
      ];
}

class NewTriviaRoute extends GetRoute {
  NewTriviaRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: NewTriviaPage.routeName,
        page: () => NewTriviaPage(
          onDoneTap: () {
            Buzz.fire(NavigateToTrivia(triviaId: 'someId'));
          },
        ),
      );
}
