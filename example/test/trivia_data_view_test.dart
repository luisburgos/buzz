import 'package:example/shared/modules/trivia/components/trivia_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TriviaDataView test1', (tester) async {
    // Given
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: MediaQueryData(),
          child: TriviaDataView(
            hostName: 'Luis',
            triviaName: 'High school times',
            triviaDescription:
                'Search the song on the Spotify app, and paste the share link!',
            triviaMainQuestion:
                'What is that song that reminds you of high school times?',
          ),
        ),
      ),
    );

    // When
    final hostNameFinder = find.text('Luis');
    final nameFinder = find.text('High school times');
    final descriptionFinder = find.text(
      'Search the song on the Spotify app, and paste the share link!',
    );
    final questionFinder = find.text(
      'What is that song that reminds you of high school times?',
    );

    // Then
    expect(hostNameFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(questionFinder, findsOneWidget);
  });
}
