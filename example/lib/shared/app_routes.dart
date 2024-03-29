import 'package:example/shared/modules/auth/login.dart';

import 'modules/home/page.dart';
import 'modules/join/page.dart';
import 'modules/new_trivia/page.dart';
import 'modules/trivia/page.dart';
import 'modules/trivia/play/page.dart';
import 'modules/trivia/scoreboard/page.dart';

class AppRoutes {
  static const root = HomePage.routeName;
  static const login = LoginPage.routeName;

  static const newTrivia = NewTriviaPage.routeName;
  static const trivia = TriviaPage.routeName;
  static const triviaPlay = TriviaPlayPage.routeName;
  static const triviaScoreboard = TriviaScoreboardPage.routeName;
  static const join = JoinPage.routeName;

  static const profileRoot = '/profile';
  static const profileEdit = '/profile/edit';
  static const profileSettings = '/profile/settings';
  static const notFound = '/not-found';
}
