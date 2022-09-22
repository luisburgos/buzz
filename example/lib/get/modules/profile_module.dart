import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../../shared/app_routes.dart';
import '../../shared/modules/profile/data/profile_repository.dart';
import '../../shared/modules/profile/presentation/screen.dart';
import '../extensions/get_module.dart';

class ProfileModule extends GetModule {
  @override
  List<GetBind> get binds => [
        GetBind(() {
          Get.put<IProfileRepository>(ProfileRepository());
        }),
      ];

  @override
  List<GetRoute> get routes => [
        ProfileRoute(),
      ];
}

class ProfileRoute extends GetRoute {
  ProfileRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: AppRoutes.profileRoot,
        page: () => ProfileScreen(
          onBackToHomePressed: () {
            Buzz.fire(NavigateBackCommand());
          },
        ),
        binding: BindingsBuilder(() {
          //TODO: Bind ViewController.
        }),
      );
}
