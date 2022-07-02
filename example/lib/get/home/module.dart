import '../extensions/get_module.dart';
import 'page.dart';

class HomeModule extends GetModule {
  @override
  List<GetRoute> get routes => [
        HomeRoute(),
      ];
}
