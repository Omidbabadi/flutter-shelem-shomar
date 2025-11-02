import 'package:flutter/material.dart';
import 'package:myapp/models/game.dart';
import 'package:myapp/models/game_settings.dart';
import 'package:myapp/models/team.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'game_controller.g.dart';

@Riverpod(keepAlive: true)
class GameController extends _$GameController {
  @override
  Game build() {
    _settings = GameSettings(
      endGameDiffrence: 1165,
      maxClaimedPoint: 165,
      doubleMinusPoint: 85,kingGetsAllPoints: 165
    );
    _team1 = Team(totalScores: [0], totalSoareSum: 0, name: 'Team 1', id: '1');
    _team2 = Team(totalScores: [0], totalSoareSum: 0, name: 'Team 2', id: '2');
    _teams.addAll([_team1, _team2]);
    _kingTeamId = _team1.id;
    return Game(
      teams: _teams,
      gameSettings: _settings,
      kingTeamId: _kingTeamId,
    );
  }

  late GameSettings _settings;
  late Team _team1;
  late Team _team2;
  late String _kingTeamId;
  final List<Team> _teams = [];

  String get kingTeamId => _kingTeamId;

  setKingTeamId(String id) {
    _kingTeamId = id;
    state = state.copyWith(kingTeamId: _kingTeamId);
  }

  calculatePoints(String id, int claimedPoint, int earnedByOtherTeam) {
    debugPrint(id);
    final bool kingWins =
        (claimedPoint + earnedByOtherTeam) <= _settings.maxClaimedPoint;
    debugPrint('controller started');
    print(kingWins);
    if (kingWins) {
      final newTeams = state.kingWins(id, claimedPoint, earnedByOtherTeam);
      final newState = state.copyWith(teams: newTeams);
      debugPrint('${newState.teams[0].totalScores}');
      state = newState;
    } else {
      final newTeams = state.kingLoses(id, claimedPoint, earnedByOtherTeam);
      final newState = state.copyWith(teams: newTeams);
      state = newState;
    }
  }
}
