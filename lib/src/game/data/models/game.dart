import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/src/game/data/models/game_settings.dart';
import 'package:myapp/src/game/data/models/team.dart';

class GameModel {
  GameModel({
    required this.teams,
    required this.gameSettings,
    required this.kingTeamId,
  });

  final List<TeamModel> teams;
  final GameSettingsModel gameSettings;
  final String kingTeamId;

  GameModel copyWith({
    List<TeamModel>? teams,
    GameSettingsModel? gameSettings,
    String? kingTeamId,
  }) {
    return GameModel(
      teams: teams ?? this.teams,
      gameSettings: gameSettings ?? this.gameSettings,
      kingTeamId: kingTeamId ?? this.kingTeamId,
    );
  }

  Map<String, dynamic> toJson() => {
    'teams': teams.map((e) => e.toJson()).toList(),
    'gameSettings': gameSettings.toJson(),
    'kingTeamId': kingTeamId,
  };

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    teams: List<TeamModel>.from(json['teams'].map((e) => TeamModel.fromJson(e))),
    gameSettings: GameSettingsModel.fromJson(json['gameSettings']),
    kingTeamId: json['kingTeamId'],

  );

  Game toEntity() {
    return Game(
      gameSettings: gameSettings,
      kingTeamId: kingTeamId,
      teams: teams.map((e) => e.toEntity(e)).toList(),
    );
  }
}
