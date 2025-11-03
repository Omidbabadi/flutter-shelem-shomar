import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/core/common/entities/team.dart';
import 'package:myapp/src/game/data/datasrc/game_datasrc.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

class GameRepoImpl implements GameRepo {
  const GameRepoImpl(this._datasrc);
  final GameLocalDatasrc _datasrc;

  @override
  List<Team> kingLosses(String id, int claimedPoint, int earnedByOtherTeam) {
    final teams = _datasrc.kingLosses(id, claimedPoint, earnedByOtherTeam);
    return teams;
  }

  @override
  List<Team> kingWins(String id, int claimedPoint, int earnedByOtherTeam) {
    final teams = _datasrc.kingWins(id, claimedPoint, earnedByOtherTeam);
    return teams;
  }

  @override
  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam) {
    final shouladKingWing = _datasrc.shouldKingWin(
      claimedPoint,
      earnedByOtherTeam,
    );
    return shouladKingWing;
  }

  @override
  // TODO: implement game
  Game get game => throw UnimplementedError();
}
