import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

import '../../../../core/common/params/points_params.dart';

class KingWin extends UsecaseWithParams<Game,PointsParams > {
  const KingWin(this._repo);
  final GameRepo _repo;

  @override
  Game call(PointsParams params) => _repo.kingWins(params.id, params.claimedPoint, params.earnedByOtherTeam,);
}
