import 'package:myapp/core/common/entities/game.dart';


abstract class GameRepo {
  const GameRepo();

  Game editTeamName(String id,String newName);
  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam);
  Game kingWins(String id, int claimedPoint, int earnedByOtherTeam);
  Game kingLosses(String id, int claimedPoint, int earnedByOtherTeam);
  Game setKingTeam(String id);
}
