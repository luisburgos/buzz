import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../../shared/app_routes.dart';
import '../../shared/modules/home/home_page.dart';

class HomeGetPage extends GetPage {
  HomeGetPage()
      : super(
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
