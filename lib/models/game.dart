import 'package:flutter/widgets.dart';
import 'package:myapp/models/game_settings.dart';
import 'package:myapp/models/team.dart';

class Game {
  Game({
    required this.teams,
    required this.gameSettings,
    required this.kingTeamId,
  });
  final List<Team> teams;
  final GameSettings gameSettings;
  final String kingTeamId;

  Game copyWith({
    List<Team>? teams,
    GameSettings? gameSettings,
    String? kingTeamId,
  }) {
    return Game(
      teams: teams ?? this.teams,
      gameSettings: gameSettings ?? this.gameSettings,
      kingTeamId: kingTeamId ?? this.kingTeamId,
    );
  }

  List<Team> shelem(String id, bool kingWins) {
    final newScores = teams.map((e) {
      if (e.id == id) {
        e.totalScores.add(kingWins ? 330 : -330);
        return e;
      } else {
        e.totalScores.add(0);
        return e;
      }
    }).toList();

    return newScores;
  }

  List<Team> kingWins(String id, int claimedPoint, int earnedByOtherTeam) {
    if (earnedByOtherTeam == 0) {
      claimedPoint = gameSettings.kingGetsAllPoints;
    }
    final newScores = teams.map((e) {
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

  List<Team> kingLoses(String id, int claimedPoint, int earnedByOtherTeam) {
    final bool shouldDoubleIt =
        earnedByOtherTeam >= gameSettings.doubleMinusPoint;
    if (shouldDoubleIt) {
      claimedPoint *= -2;
    }
    final newScores = teams.map((e) {
      if (e.id == id) {
        e.totalScores.add(claimedPoint * -1);
        debugPrint(e.name);
        debugPrint(e.totalScores.toString());
        return e;
      } else {
        debugPrint(e.name);
        e.totalScores.add(earnedByOtherTeam);
        debugPrint(e.totalScores.toString());

        return e;
      }
    }).toList();
    return newScores;
  }
}
