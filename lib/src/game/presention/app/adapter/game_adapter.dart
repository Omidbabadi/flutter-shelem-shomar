import 'package:myapp/core/common/app/riverpod/current_game.dart';
import 'package:myapp/core/common/entities/team.dart';
import 'package:myapp/src/game/domain/usecase/edit_team_name.dart';
import 'package:myapp/src/game/domain/usecase/king_loses.dart';
import 'package:myapp/src/game/domain/usecase/king_win.dart';
import 'package:myapp/src/game/domain/usecase/set_king_team.dart';
import 'package:myapp/src/game/domain/usecase/should_king_win.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/common/entities/game.dart';
import '../../../../../core/common/params/points_params.dart';
import '../../../../../core/services/injection_container.dart';

part 'game_adapter.g.dart';
part 'game_state.dart';

@riverpod
class GameAdapter extends _$GameAdapter {
  @override
  GameState build() {
    _kingLose = sl<KingLose>();
    _kingWin = sl<KingWin>();
    _shouldKingWin = sl<ShouldKingWin>();
    _setKingTeam = sl<SetKingTeam>();

    return const GameInit();
  }

  late KingWin _kingWin;
  late KingLose _kingLose;
  late ShouldKingWin _shouldKingWin;
  late EditTeamName _editTeamName;
  late SetKingTeam _setKingTeam;

  void setKingTeam(String id) {
    final result = _setKingTeam.call(id);
    ref.read(currentGameProvider.notifier).setGame(result);
  }

  void editTeamName(String id, String newName) {
    final param = NewNameParams(id, newName);
    final newGame = _editTeamName.call(param);
    ref.read(currentGameProvider.notifier).setGame(newGame);
  }

  bool shouldKingWin(int claimedPoint, int earnedByOtherTeam) {
    final params = ShouldKingWinParams(
      claimedPoint: claimedPoint,
      earnedByOtherTeam: earnedByOtherTeam,
    );
    final result = _shouldKingWin.call(params);
    print(result);
    return result;
  }

  void calculatePoint(String id, int claimedPoint, int earnedByOtherTeam) {
    final kingWins = shouldKingWin(claimedPoint, earnedByOtherTeam);
    final params = PointsParams(
      id: id,
      claimedPoint: claimedPoint,
      earnedByOtherTeam: earnedByOtherTeam,
    );
    if (kingWins) {
      final game = _kingWin.call(params);
      ref.read(currentGameProvider.notifier).setGame(game);
      state = KingWins(game);
    } else {
      final game = _kingLose.call(params);
      ref.read(currentGameProvider.notifier).setGame(game);

      state = KingLoses(game);
    }
  }
}
