import 'package:myapp/core/common/entities/game_settings.dart';
import 'package:myapp/core/common/entities/team.dart';

class Game {
  Game({
    required this.teams,
    required this.gameSettings,
    required this.kingTeamId,
    required this.claimedPoint
  });
  final List<Team> teams;
  final GameSettings gameSettings;
  final String kingTeamId;
  final List<int> claimedPoint;
}
