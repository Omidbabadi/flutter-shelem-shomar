part of 'game_adapter.dart';

sealed class GameState {
  const GameState();
}

final class GameInit extends GameState {
  const GameInit();
}

final class KingWins extends GameState {
  const KingWins(this.kingScore, this.otherTeamScore);
  final int kingScore;
  final int otherTeamScore;
}

final class KingLoses extends GameState {
  const KingLoses(this.kingScore, this.otherTeamScore);
  final int kingScore;
  final int otherTeamScore;
}

final class GameEnds extends GameState {
  final Team winner;
  final Team loser;
  const GameEnds(this.winner, this.loser);
}
