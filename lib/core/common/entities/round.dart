import 'package:myapp/core/common/entities/team.dart';

abstract class Round {
  final String id;
  final List<Team> teams;
  final List<int> claimedPoints;
  final Team? loserTeam;
  final Team? winnerTeam;

  Round({
    required this.id,
    required this.teams,
    required this.claimedPoints,
    this.loserTeam,
    this.winnerTeam,
  });
}
