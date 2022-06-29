import 'package:flutter/material.dart';
import 'package:profile/presentation/view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.onBackToHomePressed,
  }) : super(key: key);

  final Function() onBackToHomePressed;

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}
