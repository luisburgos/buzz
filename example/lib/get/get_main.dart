import 'package:get/get.dart';

import '../bootstrap.dart';
import '../shared/app_routes.dart';
import '../shared/not_found_page.dart';
import 'get_bindings.dart';
import 'get_pages.dart';

void main() {
  return bootstrap(
    GetMaterialApp(
      unknownRoute: GetPage(
        name: AppRoutes.notFound,
        page: () => const NotFoundPage(),
      ),
      initialBinding: InitialBindingsBuilder(),
      getPages: getPages,
    ),
  );
}
