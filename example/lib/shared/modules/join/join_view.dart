import 'package:buzz/buzz.dart';
import 'package:core/core.dart';
import 'package:example/shared/modules/trivia/components/trivia_data_view.dart';
import 'package:example/shared/modules/trivia/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinView extends StatelessWidget {
  const JoinView({
    Key? key,
    required this.joinCode,
  }) : super(key: key);

  final String joinCode;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      JoinViewController(joinCode),
      tag: joinCode,
    );

    return Obx(() {
      final joinCode = controller.joinCode();

      return LabeledSection(
        label: 'joinCode: $joinCode',
        child: Column(
          children: [
            const TriviaDataView(
              hostName: 'hostName',
              triviaName: 'hostName',
              triviaDescription: 'hostName',
              triviaMainQuestion: 'hostName',
            ),
            MainActionWidget(
              action: MainAction(
                label: 'Join to $joinCode',
                onPressed: () {
                  debugPrint('$runtimeType onJoinConfirmTap');
                  controller.onJoinConfirmTap('someId');
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class JoinViewController extends GetxController {
  late Rx<String> joinCode;

  JoinViewController(String code) : joinCode = code.obs;

  void onJoinConfirmTap(String triviaId) {
    Buzz.fire(NavigateToTrivia(triviaId: triviaId));
  }
}
