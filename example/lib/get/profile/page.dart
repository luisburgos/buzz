import 'package:buzz/buzz.dart';
import 'package:get/get.dart';
import 'package:profile/profile.dart';

import '../../shared/app_routes.dart';

class ProfileGetPage extends GetPage {
  ProfileGetPage()
      : super(
          name: AppRoutes.profileRoot,
          page: () => ProfileScreen(
            onBackToHomePressed: () {
              Get.find<IBuzzBase>().fire(
                NavigateBackCommand(),
              );
            },
          ),
        );
}
