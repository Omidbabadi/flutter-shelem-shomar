import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

import '../../../../core/common/entities/game.dart';

class SetKingTeam extends UsecaseWithParams<Game, String> {
  const SetKingTeam(this._repo);

  final GameRepo _repo;

  @override
  Game call(String param) => _repo.setKingTeam(param);
}
