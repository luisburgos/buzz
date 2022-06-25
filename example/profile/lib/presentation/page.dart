import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/view.dart';

import '../profile.dart';
import '../utils.dart';
import 'ui_event.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
    required this.profileStream,
    required this.onBackToHomePressed,
  }) : super(key: key);

  final Stream<Profile?> profileStream;
  final Function() onBackToHomePressed;

  @override
  Widget build(BuildContext context) {
    return ManagedStreamBuilder<Profile?>(
      stream: profileStream,
      onLoading: () {
        return const CircularProgressIndicator();
      },
      onData: (data) {
        final profile = data as Profile;

        return NamedPage(
          name: 'User',
          body: Column(
            children: [
              ProfileView(
                userName: profile.userInfo.name,
                items: profile.options,
                onItemTap: (itemId) {
                  switch (itemId) {
                    case 'accounts':
                      Buzz.fire(OnOptionSelected());
                      break;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Buzz.fire(OnChangeNameTapped());
                },
                child: const Text('Change name'),
              ),
            ],
          ),
          action: MainAction(
            label: 'Go Settings',
            onPressed: () {
              Buzz.fire(OnGoToSettingsTapped());
            },
          ),
        );
      },
      onError: (error) {
        return Container();
      },
    );
  }
}
