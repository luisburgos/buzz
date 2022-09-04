import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';
import 'package:neopop/utils/color_utils.dart';

import 'constants.dart';

class AppTextStyles {
  static TextStyle label(Color color) => TextStyle(
        color: color,
        height: 1.2,
        letterSpacing: 1.0,
      );

  static TextStyle whiteLabel = const TextStyle(
    color: Colors.white,
    height: 1.2,
    letterSpacing: 1.0,
  );

  static TextStyle blackLabel = const TextStyle(
    color: kSecondaryButtonColor,
    height: 1.2,
    letterSpacing: 1.0,
  );

  static TextStyle whiteLabel20 = const TextStyle(
    color: Colors.white,
    height: 1.2,
    letterSpacing: 1.0,
    fontSize: 20,
  );

  static TextStyle white300Label12 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w300,
    height: 1.2,
    letterSpacing: 1.0,
    fontSize: 12,
  );

  static TextStyle whiteBoldLabel20 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: 1.0,
    fontSize: 20,
  );
}

//FIXME: Improve wrapper
class NeoPopElevatedStrokesButtonWrapper extends StatelessWidget {
  const NeoPopElevatedStrokesButtonWrapper({
    Key? key,
    required this.title,
    required this.onTapUp,
    this.fillColor,
    this.textColor,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final Color? fillColor;
  final Color? textColor;
  final Function() onTapUp;
  final bool isSelected;

  Color get buttonColor => fillColor != null
      ? fillColor!
      : isSelected
          ? kPrimaryButtonColor
          : kSecondaryButtonLightColor;

  Color get borderColor => isSelected ? kBorderColorWhite : kBorderColorGreen;

  TextStyle get textStyle => textColor != null
      ? AppTextStyles.label(textColor!)
      : isSelected
          ? AppTextStyles.blackLabel
          : AppTextStyles.whiteLabel;

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: buttonColor,
      bottomShadowColor: ColorUtils.getVerticalShadow(buttonColor).toColor(),
      rightShadowColor: ColorUtils.getHorizontalShadow(buttonColor).toColor(),
      animationDuration: kButtonAnimationDuration,
      depth: kButtonDepth,
      onTapUp: onTapUp,
      border: Border.all(
        color: borderColor,
        width: kButtonBorderWidth,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleNeoPopButton extends StatelessWidget {
  const SimpleNeoPopButton({
    Key? key,
    required this.title,
    required this.onTapUp,
    required this.color,
  }) : super(key: key);

  final String title;
  final Function()? onTapUp;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: color,
      onTapUp: onTapUp,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                height: 1.2,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
