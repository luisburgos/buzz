import 'package:get/get.dart';

import '../../shared/modules/join/page.dart';
import '../extensions/get_module.dart';

class JoinModule extends GetModule {
  @override
  List<GetRoute> get routes => [
        JoinRoute(),
      ];
}

class JoinRoute extends GetRoute {
  JoinRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: JoinPage.routeName,
        page: () => const JoinPage(),
      );
}
