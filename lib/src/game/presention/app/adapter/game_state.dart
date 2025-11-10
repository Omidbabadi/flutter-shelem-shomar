part of 'game_adapter.dart';

sealed class GameState {
  const GameState();
}

final class GameInit extends GameState {
  const GameInit();
}

final class KingWins extends GameState {
  const KingWins(this.game);
  final Game game;
}

final class KingLoses extends GameState {
  const KingLoses(this.game);
  final Game game;
}

final class GameEnds extends GameState {
  final Team winner;
  final Team loser;
  const GameEnds(this.winner, this.loser);
}
