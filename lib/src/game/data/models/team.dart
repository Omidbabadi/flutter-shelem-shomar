import '../../../../core/common/entities/team.dart';

class TeamModel extends Team {
  TeamModel({
    required super.totalScores,
    required super.totalScoreSum,
    required super.name,
    required super.id,
  });
  TeamModel copyWith({
    List<int>? totalScores,
    int? totalScoreSum,
    String? name,
    String? id,
  }) {
    return TeamModel(
      totalScores: totalScores ?? this.totalScores,
      totalScoreSum: totalScoreSum ?? this.totalScoreSum,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() => {
    'totalScores': totalScores,
    'totalScoreSum': totalScoreSum,
    'name': name,
    'id': id,
  };

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    totalScores: List<int>.from(json['totalScores']),
    totalScoreSum: json['totalScoreSum'],
    name: json['name'],
    id: json['id'],
  );

  factory TeamModel.fromEntity(Team entity) => TeamModel(
    totalScores: entity.totalScores,
    totalScoreSum: entity.totalScoreSum,
    name: entity.name,
    id: entity.id,
  );

  Team toEntity(TeamModel team) {
    return Team(
      id: id,
      name: name,
      totalScores: totalScores,
      totalScoreSum: totalScoreSum,
    );
  }
}
