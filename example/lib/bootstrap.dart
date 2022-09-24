import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future bootstrap(Widget app) async {
  //WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'],
    anonKey: dotenv.env['SUPABASE_ANNON_KEY'],
  );

  runZonedGuarded(
    () => runApp(app),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
