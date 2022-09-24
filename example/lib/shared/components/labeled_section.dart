import 'package:flutter/material.dart';

class LabeledSection extends StatelessWidget {
  const LabeledSection({
    Key? key,
    required this.label,
    required this.child,
    this.backgroundColor = Colors.red,
  }) : super(key: key);

  final String label;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueGrey,
              width: 1,
            ),
            shape: BoxShape.rectangle,
          ),
          child: Container(
            color: backgroundColor,
            child: child,
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            color: backgroundColor,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
