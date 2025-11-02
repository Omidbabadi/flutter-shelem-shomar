final class Team {
  Team({
    required this.totalScores,
    required this.totalSoareSum,
    required this.name,
    required this.id,
  });
  final List<int> totalScores;
  final int totalSoareSum;
  final String name;
  final String id;

  Team copyWith({
    List<int>? totalScores,
    int? totalSoareSum,
    String? name,
    String? id,
  }) {
    return Team(
      totalScores: totalScores ?? this.totalScores,
      totalSoareSum: totalSoareSum ?? this.totalSoareSum,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
