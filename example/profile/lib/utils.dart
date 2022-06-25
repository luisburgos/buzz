import 'package:buzz/utils.dart';
import 'package:flutter/material.dart';

void profileLog(String message) {
  developerLog(message, name: 'PROFILE');
}

typedef OnData<T> = Widget Function(T data);
typedef OnError = Widget Function(dynamic e);
typedef OnLoading = Widget Function();

class ManagedStreamBuilder<T> extends StatelessWidget {
  const ManagedStreamBuilder({
    Key? key,
    required this.stream,
    required this.onData,
    required this.onError,
    required this.onLoading,
  }) : super(key: key);

  final Stream<T> stream;
  final OnData<T?> onData;
  final OnError onError;
  final OnLoading onLoading;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onData(snapshot.data);
        } else if (snapshot.hasError) {
          return onError(snapshot.error);
        } else {
          return onLoading();
        }
      },
      stream: stream,
    );
  }
}
