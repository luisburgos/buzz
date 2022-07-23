import 'package:flutter/material.dart';

class MainAction {
  MainAction({
    required this.label,
    this.onPressed,
  });

  final String label;
  final Function()? onPressed;
}

class BasePage extends StatelessWidget {
  const BasePage({
    Key? key,
    required this.name,
    this.action,
    this.body,
    this.onSettingsPressed,
  }) : super(key: key);

  final String name;
  final MainAction? action;
  final Widget? body;
  final Function()? onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          if (onSettingsPressed != null)
            _ActionsIconButton(
              iconData: Icons.settings,
              onTap: () {
                onSettingsPressed!();
              },
            ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(name),
            if (body != null) Expanded(child: body!),
            if (action != null)
              ElevatedButton(
                onPressed: () {
                  if (action!.onPressed != null) {
                    action!.onPressed!();
                  }
                },
                child: Text(action!.label),
              )
          ],
        ),
      ),
    );
  }
}

class _ActionsIconButton extends StatelessWidget {
  const _ActionsIconButton({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(iconData),
      ),
    );
  }
}
