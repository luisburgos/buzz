import 'package:buzz/buzz.dart';
import 'package:example/get/extensions/get_module.dart';
import 'package:get/get.dart';

import '../../shared/app_routes.dart';
import '../../shared/modules/home/home_page.dart';

class HomeRoute extends GetRoute {
  @override
  GetPage get asGetPage => GetPage(
        name: AppRoutes.root,
        page: () => HomePage(
          onGoToProfilePressed: () {
            Get.find<IBuzzBase>().fire(
              NavigateToCommand.named(AppRoutes.profileRoot),
            );
          },
        ),
      );
}
