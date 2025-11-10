import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/src/game/domain/repo/game_repo.dart';

class EditTeamName extends UsecaseWithParams<Game, NewNameParams> {
  const EditTeamName(this._repo);
  final GameRepo _repo;

  @override
  Game call(NewNameParams param) => _repo.editTeamName(param.id,param.newName);
}

class NewNameParams {
  const NewNameParams(this.id, this.newName);
  final String id;
  final String newName;
}
