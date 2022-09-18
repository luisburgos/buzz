class Trivia {
  Trivia({
    required this.id,
    required this.host,
    required this.name,
    required this.description,
    required this.mainQuestion,
    required this.joinCode,
    this.game,
  });

  final String id;
  final Player host;
  final String name;
  final String description;
  final String mainQuestion;
  final String joinCode;

  Game? game;

  void init() {
    game = Game(id: 'game-1');
    addPlayer(host);
  }

  void addPlayer(Player player) {
    //
    game?.players = List.from(game?.players ?? [])..add(player);
  }

  void start() {
    game?.start();
  }
}

class Player {
  Player({
    required this.id,
    required this.name,
    required this.answer,
  });

  final String id;
  final String name;
  final String answer;
}

enum GameStatus {
  initial,
  started,
  finished,
}

class Game {
  Game({
    required this.id,
    this.status = GameStatus.initial,
    this.players = const [],
  });

  final String id;
  GameStatus status;
  List<Player> players;
  int get playersCount => players.length;

  void start() {
    status = GameStatus.started;
  }

  void finish() {
    status = GameStatus.finished;
  }
}

class Ballot {
  Ballot({
    required this.id,
    required this.player,
    this.status = BallotStatus.initial,
    this.answers = const [],
  });

  final String id;
  final Player player;
  BallotStatus status;
  List<QuestionAnswer> answers;

  void submit() {
    status = BallotStatus.submitted;
  }

  void addAnswer(QuestionAnswer answer) {
    answers = List.from(answers)..add(answer);
  }
}

enum BallotStatus {
  initial,
  submitted,
}

class Question {
  Question(this.value);
  final String value;
}

class QuestionAnswer {
  QuestionAnswer({
    required this.question,
    required this.answer,
  });
  final Question question;
  final String answer;
}
