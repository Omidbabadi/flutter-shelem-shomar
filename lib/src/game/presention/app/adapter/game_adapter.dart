import 'package:myapp/core/common/entities/team.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/common/entities/game.dart';

part 'game_adapter.g.dart';
part 'game_state.dart';

@riverpod
class GameAdapter extends _$GameAdapter {
  @override
  GameState build() {
    return const GameInit();
  }
  
}
