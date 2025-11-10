import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

import '../../../../core/common/params/points_params.dart';

class KingLose extends UsecaseWithParams<Game,PointsParams > {
  const KingLose(this._repo);
  final GameRepo _repo;

  @override
  Game call(PointsParams params) => _repo.kingLosses(params.id, params.claimedPoint, params.earnedByOtherTeam,);
}
