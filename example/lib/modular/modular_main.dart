import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bootstrap.dart';
import 'modules.dart';

void main() {
  return bootstrap(
    ModularApp(
      module: ModularAppRootModule(),
      child: const ModularAppWidget(),
    ),
  );
}

class ModularAppWidget extends StatelessWidget {
  const ModularAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Modular App Test',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}
