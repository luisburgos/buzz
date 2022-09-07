import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../buzz.dart';
import '../../wrappers.dart';

class DashboardViewTemplate extends StatelessWidget {
  const DashboardViewTemplate({
    Key? key,
    required this.actionsBar,
    required this.body,
    required this.onRouteChanged,
    required this.onGoToAppTapped,
  }) : super(key: key);

  final Widget actionsBar;
  final Widget body;
  final Function(String?) onRouteChanged;
  final Function onGoToAppTapped;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      DashboardController(
        titleBuilder: (index, previousTitle) {
          debugPrint('$runtimeType onBuildTitle:$index');
          if (index == 0) return 'UiEvents';
          if (index == 1) return 'Commands';
          if (index == 2) return 'AppEvents';
          return previousTitle;
        },
      ),
      tag: 'event_dashboard',
    );

    return Obx(() {
      return Scaffold(
        //TODO: Improve colors by supporting dark mode toggling.
        backgroundColor: Colors.black87,
        body: Column(
          children: [
            Row(
              children: [
                NeoPopElevatedStrokesButtonWrapper(
                  title: 'Ui Events',
                  onTapUp: () => _onItemTap(0),
                  isSelected: controller.currentIndex() == 0,
                ),
                NeoPopElevatedStrokesButtonWrapper(
                  title: 'Commands',
                  onTapUp: () => _onItemTap(1),
                  isSelected: controller.currentIndex() == 1,
                ),
                NeoPopElevatedStrokesButtonWrapper(
                  title: 'App Events',
                  onTapUp: () => _onItemTap(2),
                  isSelected: controller.currentIndex() == 2,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextButton(
                    onPressed: () => onGoToAppTapped(),
                    child: Text(
                      'Go to App',
                      style: AppTextStyles.whiteLabel,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            const Divider(height: 2),
            Expanded(
              child: body,
            ),
            const Divider(height: 2),
            actionsBar,
          ],
        ),
      );
    });
  }

  void _onItemTap(int? index) {
    Buzz.fire(OnChangePageRequested(index));
  }
}

typedef DashboardTitleBuilder = String? Function(
  int index,
  String previousTitle,
);

typedef DashboardRouteBuilder = String? Function(int index);

class OnChangePageRequested extends UiEvent {
  OnChangePageRequested(this.index);
  final int? index;
}

class DashboardController extends GetxController {
  DashboardController({
    required this.titleBuilder,
  });

  var currentIndex = 0.obs;
  var title = ''.obs;

  final DashboardTitleBuilder titleBuilder;

  StreamSubscription? onChangePageRequestedSubscription;

  @override
  void onInit() {
    onChangePageRequestedSubscription = Buzz.on<OnChangePageRequested>().listen(
      (event) {
        final currentTitle = title();
        final newIndex = event.index ?? -1;
        currentIndex(newIndex);
        title(titleBuilder(newIndex, currentTitle));
      },
    );
    super.onInit();
  }

  @override
  void onClose() {
    onChangePageRequestedSubscription?.cancel();
    onChangePageRequestedSubscription = null;
    super.onClose();
  }
}
