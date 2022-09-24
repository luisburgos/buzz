import 'package:example/shared/components/labeled_section.dart';
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
    return LabeledSection(
      label: 'TriviaData',
      backgroundColor: Colors.blueGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _TriviaDataViewLabel(hostName),
          _TriviaDataViewLabel(triviaName),
          _TriviaDataViewLabel(triviaDescription),
          _TriviaDataViewLabel(triviaMainQuestion),
        ],
      ),
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
        vertical: 4,
        horizontal: 12,
      ),
      child: Center(
        child: Text(content),
      ),
    );
  }
}
