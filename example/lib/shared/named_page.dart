import 'package:flutter/material.dart';

class MainAction {
  MainAction({
    required this.label,
    this.onPressed,
  });

  final String label;
  final Function()? onPressed;
}

class NamedPage extends StatelessWidget {
  const NamedPage({
    Key? key,
    required this.name,
    this.action,
    this.body,
  }) : super(key: key);

  final String name;
  final MainAction? action;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
