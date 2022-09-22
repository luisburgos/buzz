import 'package:example/shared/modules/trivia/new/page.dart';
import 'package:get/get.dart';

import '../extensions/get_module.dart';

class TriviaModule extends GetModule {
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
            throw UnimplementedError('Must go to TriviaGamePage');
          },
        ),
      );
}
