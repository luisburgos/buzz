import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../bootstrap.dart';
import '../get/get_app_navigator.dart';
import '../shared/app_routes.dart';
import '../shared/modules/home/home_page.dart';
import '../shared/modules/profile/profile_page.dart';
import '../shared/not_found_page.dart';

void main() {
  return bootstrap(
    GetMaterialApp(
      unknownRoute: GetPage(
        name: AppRoutes.notFound,
        page: () => const NotFoundPage(),
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(
            Buzz..init(navigator: GetAppNavigator()),
          );
        },
      ),
      getPages: [
        GetPage(
          name: AppRoutes.root,
          page: () => HomePage(
            onGoToProfilePressed: () {
              Get.find<IBuzzBase>().fire(
                NavigateToCommand.named(AppRoutes.profileRoot),
              );
            },
          ),
        ),
        GetPage(
          name: AppRoutes.profileRoot,
          page: () => ProfilePage(
            onBackToHomePressed: () {
              Get.find<IBuzzBase>().fire(
                NavigateBackCommand(),
              );
            },
          ),
        ),
      ],
    ),
  );
}
