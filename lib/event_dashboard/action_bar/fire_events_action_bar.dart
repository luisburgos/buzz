import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

import '../../constants.dart';
import '../../wrappers.dart';

class FireEventAction {
  FireEventAction({
    required this.title,
    required this.message,
    required this.onFireTap,
  });

  final String title;
  final String message;
  final Function() onFireTap;
}

class FireEventsActionBar extends StatefulWidget {
  const FireEventsActionBar({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final List<FireEventAction> actions;

  @override
  State<FireEventsActionBar> createState() => _FireEventsActionBarState();
}

class _FireEventsActionBarState extends State<FireEventsActionBar> {
  String selectedId = '';

  @override
  void initState() {
    selectedId = widget.actions.first.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.actions
          .map(
            (action) => _FireEventsActionBarItem(
              action: action,
              isSelected: selectedId == action.title,
              onTapUp: (title) {
                setState(() {
                  selectedId = title;
                });
              },
            ),
          )
          .toList(),
    );
  }
}

class _FireEventsActionBarItem extends StatelessWidget {
  const _FireEventsActionBarItem({
    Key? key,
    required this.action,
    required this.onTapUp,
    this.isSelected = false,
  }) : super(key: key);

  final FireEventAction action;
  final Function(String) onTapUp;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EventTriggerButton(
              title: action.title,
              onTapUp: () {
                onTapUp(action.title);
                action.onFireTap();
              },
            ),
            const SizedBox(height: 8),
            Text(
              action.message,
              style: AppTextStyles.whiteLabel,
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: Fix isSelected added by error
class EventTriggerButton extends StatelessWidget {
  const EventTriggerButton({
    Key? key,
    required this.title,
    required this.onTapUp,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final Function() onTapUp;
  final bool isSelected;

  Color get color => isSelected
      ? kSecondaryButtonLightColor
      : const Color.fromRGBO(0, 0, 0, 1);

  Color get borderColor => isSelected ? kBorderColorGreen : kBorderColorWhite;

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: color,
      border: Border.fromBorderSide(
        BorderSide(
          color: borderColor,
          width: kButtonBorderWidth,
        ),
      ),
      onTapUp: onTapUp,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 15.0,
          ),
          child: Text(
            title,
            style: AppTextStyles.whiteLabel,
          ),
        ),
      ),
    );
  }
}
