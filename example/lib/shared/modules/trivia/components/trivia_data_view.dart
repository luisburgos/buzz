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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TriviaDataViewLabel('hostName: $hostName'),
            _TriviaDataViewLabel('triviaName: $triviaName'),
            _TriviaDataViewLabel('triviaDescription: $triviaDescription'),
            _TriviaDataViewLabel('triviaMainQuestion: $triviaMainQuestion'),
          ],
        ),
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
        horizontal: 10,
      ),
      child: Text(content),
    );
  }
}
