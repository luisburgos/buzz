import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

import '../../constants.dart';
import '../../wrappers.dart';

class ConsoleViewHeader extends StatelessWidget {
  const ConsoleViewHeader(
    this.title, {
    Key? key,
    required this.onResetTap,
  }) : super(key: key);

  final String title;
  final Function() onResetTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title.toUpperCase(),
          style: AppTextStyles.whiteBoldLabel20,
        ),
        const Spacer(),
        NeoPopButton(
          color: Colors.red,
          onTapUp: onResetTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'CANCEL & CLEAR',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.2,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ConsoleViewActionsBar extends StatelessWidget {
  const ConsoleViewActionsBar({
    Key? key,
    required this.label,
    required this.onListenToEventTap,
    required this.onPauseTap,
    required this.onResumeTap,
    required this.onCancelTap,
  }) : super(key: key);

  final String label;
  final Function() onListenToEventTap;
  final Function() onPauseTap;
  final Function() onResumeTap;
  final Function() onCancelTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            NeoPopElevatedStrokesButtonWrapper(
              title: label,
              fillColor: kPopYellowColor,
              textColor: kSecondaryButtonColor,
              onTapUp: onListenToEventTap,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            NeoPopElevatedStrokesButtonWrapper(
              title: 'Pause',
              onTapUp: onPauseTap,
            ),
            NeoPopElevatedStrokesButtonWrapper(
              title: 'Resume',
              onTapUp: onResumeTap,
            ),
            NeoPopElevatedStrokesButtonWrapper(
              title: 'Cancel',
              onTapUp: onCancelTap,
            ),
          ],
        ),
      ],
    );
  }
}
