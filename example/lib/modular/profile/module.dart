import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/modules/profile/data/profile_repository.dart';
import 'page.dart';

class ProfileModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ProfileRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ProfileRoute(),
      ];
}
