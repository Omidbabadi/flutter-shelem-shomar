import '../../../../core/common/entities/round.dart';
import 'team.dart';

class RoundModel extends Round {
  RoundModel({
    required super.id,
    required super.teams,
    required super.claimedPoints,
    super.loserTeam,
    super.winnerTeam,
  });

  RoundModel copyWith({
    String? id,
    List<TeamModel>? teams,
    List<int>? claimedPoints,
    TeamModel? loserTeam,
    TeamModel? winnerTeam,
  }) => RoundModel(
    id: id ?? this.id,
    teams: teams ?? this.teams,
    claimedPoints: claimedPoints ?? this.claimedPoints,
    loserTeam: loserTeam ?? this.loserTeam,
    winnerTeam: winnerTeam ?? this.winnerTeam,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'teams': teams.map((team) {
      final teamModel = TeamModel.fromE;
      return teamModel.toJson();
    } ).toList(),
  };
}
