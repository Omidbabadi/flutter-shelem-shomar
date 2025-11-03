import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

class ShouldKingWin extends UsecaseWithParams<bool,ShouldKingWinParams > {
  const ShouldKingWin(this._repo);
  final GameRepo _repo;

  @override
  bool call(ShouldKingWinParams params) => _repo.shouldKingWin(params.claimedPoint, params.earnedByOtherTeam,);
}

class ShouldKingWinParams {
  final int claimedPoint;
  final int earnedByOtherTeam;

  ShouldKingWinParams({required this.claimedPoint, required this.earnedByOtherTeam});

}
