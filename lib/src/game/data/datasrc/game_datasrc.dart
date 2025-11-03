import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/src/game/data/models/game.dart';
import 'package:myapp/src/game/data/models/team.dart';

abstract class GameLocalDatasrc {
  Game get game;
  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam);
  List<TeamModel> kingWins(String id, int claimedPoint, int earnedByOtherTeam);
  List<TeamModel> kingLosses(
    String id,
    int claimedPoint,
    int earnedByOtherTeam,
  );
}

class GameLocalDatasrcImpl implements GameLocalDatasrc {
  const GameLocalDatasrcImpl(this._game);

  final GameModel _game;

  @override
  Game get game => _game.toEntity();

  @override
  List<TeamModel> kingLosses(
    String id,
    int claimedPoint,
    int earnedByOtherTeam,
  ) {
    final bool shouldDoubleIt =
        earnedByOtherTeam >= _game.gameSettings.doubleMinusPoint;
    if (shouldDoubleIt) {
      claimedPoint *= -2;
    }
    final newScores = _game.teams.map((e) {
      if (e.id == id) {
        e.totalScores.add(claimedPoint * -1);

        return e;
      } else {
        e.totalScores.add(earnedByOtherTeam);

        return e;
      }
    }).toList();
    return newScores;
  }

  @override
  List<TeamModel> kingWins(String id, int claimedPoint, int earnedByOtherTeam) {
    if (earnedByOtherTeam == 0) {
      claimedPoint = _game.gameSettings.kingGetsAllPoints;
    }
    final newScores = _game.teams.map((e) {
      if (e.id == id) {
        e.totalScores.add(claimedPoint);
        return e;
      } else {
        e.totalScores.add(earnedByOtherTeam);
        return e;
      }
    }).toList();

    return newScores;
  }

  @override
  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam) {
    return (claimedPoint + earnedByOtherTeam) <=
        _game.gameSettings.maxClaimedPoint;
  }
}
