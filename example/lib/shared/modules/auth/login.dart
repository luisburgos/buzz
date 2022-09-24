import 'dart:async';

import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';
  static const String pageName = 'LoginPage';

  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      name: pageName,
      body: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginViewController());

    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: controller.isLoading()
                ? const CircularProgressIndicator()
                : Text(controller.loginResultString),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: controller.emailTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter valid email id as abc@gmail.com',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MainActionWidget(
              action: MainAction(
                label: 'Sign In',
                onPressed: () => controller.onSignInTap(),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class LoginViewController extends GetxController {
  RxBool isLoading = false.obs;
  final emailTextController = TextEditingController();
  StreamSubscription? subscription;
  Rx<LoginCommandResult?> loginResult = Rxn<LoginCommandResult>();

  String get loginResultString {
    final result = loginResult();
    if (result != null) {
      return 'user: ${result.user} – error: ${result.errorMessage}';
    }

    return 'No login result yet';
  }

  @override
  void onInit() {
    subscription = Buzz.on<LoginCommandResult>().listen(_onLoginCommandResult);
    super.onInit();
  }

  void onSignInTap() {
    final email = emailTextController.text;
    isLoading(true);
    Buzz.fire(LoginCommand(email: email));
  }

  @override
  void onClose() {
    emailTextController.dispose();
    subscription?.cancel();
    subscription = null;
    super.onClose();
  }

  void _onLoginCommandResult(LoginCommandResult result) {
    isLoading(false);
    loginResult(result);
  }
}

class LoginCommand extends Command {
  LoginCommand({
    required this.email,
  });
  final String email;
}

class LoginCommandHandler extends CommandHandler<LoginCommand> {
  @override
  void handle(LoginCommand event) async {
    final response = await Supabase.instance.client.auth.signIn(
      email: event.email,
    );

    final user = response.data?.user;
    final error = response.error;

    if (error != null) {
      Buzz.fire(LoginCommandResult.failure(error.message));
      return;
    }

    //TODO: Avoid leaking data models
    Buzz.fire(LoginCommandResult.success(user));
  }
}

class LoginCommandResult {
  final User? user;
  final String? errorMessage;

  LoginCommandResult.success(this.user) : errorMessage = null;
  LoginCommandResult.failure(this.errorMessage) : user = null;
}
