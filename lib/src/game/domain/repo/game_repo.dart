import 'package:myapp/core/common/entities/game.dart';

import '../../../../core/common/entities/team.dart';

abstract class GameRepo {
  const GameRepo();

  Game get game;
  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam);
  List<Team> kingWins(String id, int claimedPoint, int earnedByOtherTeam);
  List<Team> kingLosses(String id, int claimedPoint, int earnedByOtherTeam);
}
