import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/src/game/data/datasrc/game_datasrc.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

class GameRepoImpl implements GameRepo {
  const GameRepoImpl(this._datasrc);
  final GameLocalDatasrc _datasrc;

  @override
  Game editTeamName(String id, String newName) {
    final game = _datasrc.editTeamName(id, newName);
    return game;
  }

  @override
  Game kingLosses(String id, int claimedPoint, int earnedByOtherTeam) {
    final game = _datasrc.kingLosses(id, claimedPoint, earnedByOtherTeam);
    return game;
  }

  @override
  Game kingWins(String id, int claimedPoint, int earnedByOtherTeam) {
    final game = _datasrc.kingWins(id, claimedPoint, earnedByOtherTeam);
    return game;
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
  Game setKingTeam(String id) {
    return _datasrc.setKingTeam(id);
  }
}
