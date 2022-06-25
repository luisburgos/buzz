import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';

void bootstrap(Widget app) {
  //WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () => runApp(app),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
