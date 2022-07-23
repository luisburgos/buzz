import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../shared/modules/profile/data/profile_repository.dart';
import '../shared/modules/profile/module_registry.dart';
import 'extensions/get_module.dart';
import 'home/module.dart';
import 'overrides/app_navigator.dart';
import 'overrides/feedbacks_executor.dart';
import 'profile/module.dart';

class CoreModule extends GetModule {
  @override
  List<GetBind> get binds => [
        GetBind(() {
          Get.put(
            Buzz
              ..init(
                navigator: GetAppNavigator(),
                feedbacksExecutor: GetFeedbacksExecutor(),
                moduleRegistries: [
                  ProfileModuleRegistries(
                    () => Get.find<IProfileRepository>(),
                  ),
                ],
              ),
          );
        }),
      ];

  @override
  List<GetModuleRoute> get routes => [
        GetModuleRoute(
          module: HomeModule(),
        ),
        GetModuleRoute(
          module: ProfileModule(),
        ),
      ];
}
