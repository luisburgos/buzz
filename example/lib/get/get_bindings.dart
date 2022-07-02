import 'package:buzz/buzz.dart';
import 'package:get/get.dart';
import 'package:profile/profile.dart';

import 'get_app_navigator.dart';
import 'get_feedbacks_executor.dart';

class InitialBindingsBuilder extends BindingsBuilder {
  InitialBindingsBuilder()
      : super(() {
          //Repositories
          Get.put<IProfileRepository>(ProfileRepository());
          //Profile
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
        });
}
