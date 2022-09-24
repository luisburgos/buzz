import 'package:buzz/buzz.dart';
import 'package:get/get.dart';

import '../../shared/modules/auth/login.dart';
import '../extensions/get_module.dart';

class AuthModuleBuzzRegistry extends BuzzRegistry {
  @override
  void register(BuzzBase buzz) {
    buzz.on<LoginCommand>().listen(
          (event) => LoginCommandHandler().handle(event),
        );
  }
}

class AuthModule extends GetModule {
  @override
  List<GetRoute> get routes => [
        LoginRoute(),
      ];
}

class LoginRoute extends GetRoute {
  LoginRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: LoginPage.routeName,
        page: () => const LoginPage(),
      );
}
