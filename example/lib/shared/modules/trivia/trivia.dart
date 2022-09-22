import 'package:flutter/material.dart';

class HomePage {
  static const String routeName = '/';
  static const String pageName = 'HomePage';

  Widget viewBuilder() => const HomeView();
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('New trivia game'),
          onPressed: () {},
        ),
      ),
    );
  }
}
