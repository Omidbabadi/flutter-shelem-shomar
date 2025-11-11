import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/src/game/data/models/game.dart';

abstract class GameLocalDatasrc {
  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam);
  Game kingWins(String id, int claimedPoint, int earnedByOtherTeam);
  Game kingLosses(String id, int claimedPoint, int earnedByOtherTeam);
  Game editTeamName(String id, String newName);
  Game setKingTeam(String id);
}

class GameLocalDatasrcImpl implements GameLocalDatasrc {
  const GameLocalDatasrcImpl(this._game);

  final GameModel _game;

  @override
  Game editTeamName(String id, String newName) {
    final teams = _game.teams;
    final newTeams = teams.map((e) {
      if (e.id == id) {
        final newTeam = e.copyWith(name: newName);
        return newTeam;
      } else {
        return e;
      }
    }).toList();
    return _game.copyWith(teams: newTeams).toEntity();
  }

  @override
  Game kingLosses(String id, int claimedPoint, int earnedByOtherTeam) {
    final bool shouldDoubleIt =
        earnedByOtherTeam >= _game.gameSettings.doubleMinusPoint;
    if (shouldDoubleIt) {
      claimedPoint *= -2;
    }
    final newScores = _game.teams.map((e) {
      if (e.id == id) {
        e.totalScores.add(claimedPoint * -1);

        return e.copyWith(totalScoreSum: e.totalScoreSum + claimedPoint);
      } else {
        e.totalScores.add(earnedByOtherTeam);

        return e.copyWith(totalScoreSum: e.totalScoreSum + claimedPoint);
      }
    }).toList();
    _game.claimedPoint.add(claimedPoint);
    final game = _game.copyWith(teams: newScores);
    return game.toEntity();
  }

  @override
  Game kingWins(String id, int claimedPoint, int earnedByOtherTeam) {
    if (earnedByOtherTeam == 0) {
      claimedPoint = _game.gameSettings.kingGetsAllPoints;
    }
    final newScores = _game.teams.map((e) {
      if (e.id == id) {
        e.totalScores.add(claimedPoint);
        return e.copyWith(totalScoreSum: e.totalScoreSum + claimedPoint);
      } else {
        e.totalScores.add(earnedByOtherTeam);
        return e.copyWith(totalScoreSum: e.totalScoreSum + claimedPoint);
      }
    }).toList();
    _game.claimedPoint.add(claimedPoint);

    final game = _game.copyWith(teams: newScores);

    return game.toEntity();
  }

  @override
  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam) {
    return (claimedPoint + earnedByOtherTeam) <=
        _game.gameSettings.maxClaimedPoint;
  }

  @override
  Game setKingTeam(String id) => _game.copyWith(kingTeamId: id).toEntity();
}
