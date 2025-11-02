class GameSettings {
  GameSettings({
    required this.endGameDiffrence,
    required this.maxClaimedPoint,
    required this.doubleMinusPoint,
    required this.kingGetsAllPoints
  });
  final int endGameDiffrence;
  final int maxClaimedPoint;
  final int doubleMinusPoint;
  final int kingGetsAllPoints;

  GameSettings copyWith({
    int? endGameDiffrence,
    int? maxClaimedPoint,
    int? doubleMinusPoint,
    int? kingGetsAllPoints
  }) {
    return GameSettings(
      endGameDiffrence: endGameDiffrence ?? this.endGameDiffrence,
      maxClaimedPoint: maxClaimedPoint ?? this.maxClaimedPoint,
      doubleMinusPoint: doubleMinusPoint ?? this.doubleMinusPoint,
      kingGetsAllPoints: kingGetsAllPoints ?? this.kingGetsAllPoints
    );
  }
}
