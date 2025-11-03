import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

import '../../../../core/common/entities/team.dart';
import '../../../../core/common/params/points_params.dart';

class KingLose extends UsecaseWithParams<List<Team>,PointsParams > {
  const KingLose(this._repo);
  final GameRepo _repo;

  @override
  List<Team> call(PointsParams params) => _repo.kingLosses(params.id, params.claimedPoint, params.earnedByOtherTeam,);
}
