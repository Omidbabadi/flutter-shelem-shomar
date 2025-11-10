import 'package:myapp/core/common/app/cache_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/injection_container.dart';
import '../../entities/game.dart';

part 'current_game.g.dart';

@Riverpod(keepAlive: true)
class CurrentGame extends _$CurrentGame {
  @override
  Game build() {
    final cachedGame = sl<CacheHelper>().loadGame();
    return cachedGame.toEntity();
  }

  setGame(Game game) {
    state = game;
  }
}
