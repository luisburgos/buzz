import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../bootstrap.dart';
import '../get/core_module.dart';
import '../shared/app_routes.dart';
import '../shared/not_found_page.dart';
import 'modules/auth_module.dart';
import 'overrides/app_navigator.dart';
import 'overrides/feedbacks_executor.dart';

Future main() async {
  Buzz.init(
    withDebugDashboard: true,
    rootAppRoute: '/',
    navigator: GetAppNavigator(),
    feedbacksExecutor: GetFeedbacksExecutor(),
    initialRegistries: [
      AuthModuleBuzzRegistry(),
    ],
  );

  return bootstrap(
    GetMaterialApp(
      title: 'Get App Test',
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
        name: AppRoutes.notFound,
        page: () => const NotFoundPage(),
      ),
      initialBinding: BindingsBuilder(() {
        CoreModule().runBinds();
      }),
      getPages: CoreModule().buildPages(),
    ),
  );
}
