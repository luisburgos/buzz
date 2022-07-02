import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view_controller.dart';
import 'view_template.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileViewController());

    return Obx(() {
      return BasePage(
        name: 'User',
        body: Column(
          children: [
            ///TODO: Change to ProfileViewList component
            ///TODO: Add a new ProfileViewTemplate component.
            ProfileViewTemplate(
              userName: controller.profile.value.userInfo.name,
              items: controller.profile.value.options,
              onItemTap: (itemId) {
                switch (itemId) {
                  case 'accounts':
                    controller.onOptionSelected();
                    break;
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.onChangeNameTapped();
              },
              child: const Text('Change name'),
            ),
          ],
        ),
        action: MainAction(
          label: 'Go Settings',
          onPressed: () {
            controller.onGoToSettingsTapped();
          },
        ),
      );
    });
  }
}
