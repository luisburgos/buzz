import 'package:get/get.dart';

import '../bootstrap.dart';
import '../get/core_module.dart';
import '../shared/app_routes.dart';
import '../shared/not_found_page.dart';

void main() {
  return bootstrap(
    GetMaterialApp(
      title: 'Get App Test',
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
