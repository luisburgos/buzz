import 'package:example/get/profile/page.dart';
import 'package:get/get.dart';

import '../../shared/modules/profile/data/profile_repository.dart';
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
