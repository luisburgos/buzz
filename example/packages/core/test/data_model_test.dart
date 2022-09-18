import 'package:core/data_model.dart';
import 'package:test/test.dart';

final player1 = Player(
  id: 'player-1',
  name: 'Luis',
  answer: 'ANSWER-1',
);
final player2 = Player(
  id: 'player-2',
  name: 'Javier',
  answer: 'ANSWER-2',
);
final player3 = Player(
  id: 'player-3',
  name: 'Juan',
  answer: 'ANSWER-3',
);
final player4 = Player(
  id: 'player-4',
  name: 'Silvia',
  answer: 'ANSWER-4',
);

void main() {
  test('Trivia', () {
    /// Create a new trivia
    final trivia = Trivia(
      id: 'trivia-1',
      host: player1,
      name: 'High school times',
      description:
          'Search the song on the Spotify app, and paste the share link!',
      mainQuestion: 'What is that song that reminds you of high school times?',
      joinCode: 'a4ds-f49m-kq',
    );
    trivia.init();
    expect(trivia.game?.status, GameStatus.initial);
    expect(trivia.game?.playersCount, 1);

    /// Players Join
    trivia.addPlayer(player2);
    trivia.addPlayer(player3);
    trivia.addPlayer(player4);

    expect(trivia.game?.status, GameStatus.initial);
    expect(trivia.game?.playersCount, 4);

    /// Last Minute Player
    trivia.addPlayer(
      Player(
        id: 'player-5',
        name: 'LastMinutePlayer',
        answer: 'ANSWER-5',
      ),
    );

    expect(trivia.game?.status, GameStatus.initial);
    expect(trivia.game?.playersCount, 5);

    /// Host start the trivia
    trivia.start();
    expect(trivia.game?.status, GameStatus.started);

    //TODO: Test cannot join the game
  });

  test('Ballot', () {
    /// Create a new trivia
    final ballot = Ballot(
      id: 'ballot-1',
      player: player1,
    );

    expect(ballot.status, BallotStatus.initial);

    /// Add a guess
    /// TODO: The options by question should be the list of players.
    /// TODO: So we should be able to add answers to a map.
    ballot.addAnswer(
      QuestionAnswer(
        question: Question('ANSWER-3'),
        answer: 'Luis',
      ),
    );

    // Submit the ballot
    ballot.submit();
    expect(ballot.status, BallotStatus.submitted);
  });
}
