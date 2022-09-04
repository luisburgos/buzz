import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../../shared/app_routes.dart';
import '../../shared/modules/profile/presentation/screen.dart';
import '../extensions/get_module.dart';

class ProfileRoute extends GetRoute {
  ProfileRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: AppRoutes.profileRoot,
        page: () => ProfileScreen(
          onBackToHomePressed: () {
            Get.find<BuzzBase>().fire(
              NavigateBackCommand(),
            );
          },
        ),
        binding: BindingsBuilder(() {
          //TODO: Bind ViewController.
        }),
      );
}
