import 'dart:convert';

import 'package:myapp/src/game/data/models/game.dart';
import 'package:myapp/src/game/data/models/game_settings.dart';
import 'package:myapp/src/game/data/models/team.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  const CacheHelper(this._prefs);

  final SharedPreferences _prefs;
  static const _game = 'game';
  static const _teamsJson = 'teams';
  static const _gameSettingsJson = 'gameSettings';

  //Game
  Future<void> cacheGame(GameModel game) async {
    final gameJson = jsonEncode(game.toJson());
    await _prefs.setString(_game, gameJson);
  }

  GameModel loadGame() {
    final game = _prefs.getString(_game);
    if (game == null) {
      return GameModel(
        teams: [
          TeamModel(id: '0', name: 'ما', totalScores: [], totalScoreSum: 0),
          TeamModel(id: '1', name: 'اونا', totalScores: [], totalScoreSum: 0),
        ],
        gameSettings: GameSettingsModel(
          endGameDiffrence: 1165,
          maxClaimedPoint: 165,
          doubleMinusPoint: 85,
          kingGetsAllPoints: 165,
        ),
        kingTeamId: '1',claimedPoint: 0
      );
    }
    final decodedGame = jsonDecode(game) as GameModel;
    return decodedGame;
  }

  //Teams
  Future<void> cacheTeams(TeamModel teamA, TeamModel teamB) async {
    final teams = jsonEncode([teamA.toJson(), teamB.toJson()]);
    await _prefs.setString(_teamsJson, teams);
  }

  List<TeamModel> loadTemes() {
    final teams = _prefs.getString(_teamsJson);
    if (teams == null) {
      return [];
    }
    final decodedTeams = jsonDecode(teams) as List;
    return decodedTeams.map((e) => TeamModel.fromJson(e)).toList();
  }

  //Todo: reset only teams points
  Future<void> newGame() async {
    await _prefs.remove(_teamsJson);
  }

  //Game Settings
  Future<void> cacheGameSettings(GameSettingsModel gameSettings) async {
    final settings = jsonEncode(gameSettings.toJson());
    await _prefs.setString(_gameSettingsJson, settings);
  }

  GameSettingsModel? loadGameSettings() {
    final settings = _prefs.getString(_gameSettingsJson);
    if (settings == null) {
      return null;
    }
    final decodedsettings = jsonDecode(settings) as GameSettingsModel;
    return decodedsettings;
  }
}
