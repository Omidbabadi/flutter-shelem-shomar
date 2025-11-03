import 'package:myapp/core/common/entities/game_settings.dart';

class GameSettingsModel extends GameSettings {
  GameSettingsModel({
    required super.endGameDiffrence,
    required super.maxClaimedPoint,
    required super.doubleMinusPoint,
    required super.kingGetsAllPoints,
  });

  GameSettingsModel copyWith({
    int? endGameDiffrence,
    int? maxClaimedPoint,
    int? doubleMinusPoint,
    int? kingGetsAllPoints,
  }) {
    return GameSettingsModel(
      endGameDiffrence: endGameDiffrence ?? this.endGameDiffrence,
      maxClaimedPoint: maxClaimedPoint ?? this.maxClaimedPoint,
      doubleMinusPoint: doubleMinusPoint ?? this.doubleMinusPoint,
      kingGetsAllPoints: kingGetsAllPoints ?? this.kingGetsAllPoints,
    );
  }

  Map<String, dynamic> toJson() => {
    'endGameDiffrence': endGameDiffrence,
    'maxClaimedPoint': maxClaimedPoint,
    'doubleMinusPoint': doubleMinusPoint,
    'kingGetsAllPoints': kingGetsAllPoints,
  };

  factory GameSettingsModel.fromJson(Map<String, dynamic> json) =>
      GameSettingsModel(
        endGameDiffrence: json['endGameDiffrence'],
        maxClaimedPoint: json['maxClaimedPoint'],
        doubleMinusPoint: json['doubleMinusPoint'],
        kingGetsAllPoints: json['kingGetsAllPoints'],
      );

  GameSettings toEntity() {
    return GameSettings(
      endGameDiffrence: endGameDiffrence,
      maxClaimedPoint: maxClaimedPoint,
      doubleMinusPoint: doubleMinusPoint,
      kingGetsAllPoints: kingGetsAllPoints,
    );
  }
}
