import 'package:flutter/material.dart';

class TriviaDataView extends StatelessWidget {
  const TriviaDataView({
    Key? key,
    required this.hostName,
    required this.triviaName,
    required this.triviaDescription,
    required this.triviaMainQuestion,
  }) : super(key: key);

  final String hostName;
  final String triviaName;
  final String triviaDescription;
  final String triviaMainQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TriviaDataViewLabel(hostName),
        _TriviaDataViewLabel(triviaName),
        _TriviaDataViewLabel(triviaDescription),
        _TriviaDataViewLabel(triviaMainQuestion),
      ],
    );
  }
}

class _TriviaDataViewLabel extends StatelessWidget {
  const _TriviaDataViewLabel(
    this.content, {
    Key? key,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Center(
        child: Text(content),
      ),
    );
  }
}
