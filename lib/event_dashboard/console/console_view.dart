import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../console/console_components.dart';
import 'console_entries_view.dart';

typedef EventTransformer = String Function(dynamic event);
typedef StreamGenerator = Stream Function();

class ConsoleViewController extends GetxController {
  ConsoleViewController({
    required this.listeningType,
    required this.eventTransformer,
    required this.streamGenerator,
  });

  RxList<ConsoleEntry> events = RxList([]);

  final EventTransformer eventTransformer;
  final StreamGenerator streamGenerator;
  final Type listeningType;

  StreamSubscription? subscription;

  void startListeningEvents() {
    if (subscription != null) {
      appendOutput(
        'WARNING: Already listening for an event of type $listeningType',
      );
    } else {
      subscription = streamGenerator().listen((event) {
        appendOutput(eventTransformer(event));
      });
      appendOutput('INFO: Listening for $listeningType');
    }
  }

  void pause() {
    if (subscription != null) {
      subscription!.pause();
      appendOutput('INFO: Subscription paused.');
    } else {
      appendOutput('INFO: No subscription, cannot pause!');
    }
  }

  void resume() {
    if (subscription != null) {
      subscription!.resume();
      appendOutput('INFO: Subscription resumed.');
    } else {
      appendOutput('INFO: No subscription, cannot resume!');
    }
  }

  void cancel() {
    if (subscription != null) {
      subscription!.cancel();
      subscription = null;
      appendOutput('INFO: Subscription canceled.');
    } else {
      appendOutput('INFO: No subscription, cannot cancel!');
    }
  }

  void reset() {
    cancel();
    events.clear();
  }

  void appendOutput(String content) {
    events.add(ConsoleEntry(content));
  }
}

class ConsoleView<T> extends StatelessWidget {
  const ConsoleView({
    Key? key,
    required this.title,
    required this.tag,
    required this.listeningType,
    required this.eventTransformer,
    required this.streamGenerator,
    this.eventsListController,
    this.onOutputAppended,
  }) : super(key: key);

  final String title;
  final String tag;
  final ScrollController? eventsListController;
  final Function(int)? onOutputAppended;

  final Type listeningType;
  final EventTransformer eventTransformer;
  final StreamGenerator streamGenerator;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ConsoleViewController(
        listeningType: listeningType,
        eventTransformer: eventTransformer,
        streamGenerator: streamGenerator,
      ),
      tag: tag,
    );

    return Obx(() {
      return Container(
        width: double.infinity,
        //TODO: Move magic number to constants
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ConsoleViewHeader(
              title,
              onResetTap: () => controller.reset(),
            ),
            //TODO: Move magic number to constants
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                color: kShadowColorGrey,
                padding: const EdgeInsets.symmetric(
                  vertical: kListItemVerticalPadding,
                  horizontal: kListItemHorizontalPadding,
                ),
                child: ConsoleEntriesView(
                  entries: controller.events.toList(),
                  controller: eventsListController,
                ),
              ),
            ),
            //TODO: Move magic number to constants
            const SizedBox(height: 40),
            ConsoleViewActionsBar(
              label: 'Start listening: $title',
              onListenToEventTap: () => controller.startListeningEvents(),
              onPauseTap: () => controller.pause(),
              onResumeTap: () => controller.resume(),
              onCancelTap: () => controller.cancel(),
            ),
          ],
        ),
      );
    });
  }
}
