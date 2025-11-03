import 'package:myapp/core/common/entities/game.dart';
import 'package:myapp/core/usecase/usecase.dart';

import '../repo/game_repo.dart';

class GetGame extends UsecaseGettter<Game> {
  const GetGame(this._repo);
  final GameRepo _repo;

  @override
  Game get call => _repo.game;
}
