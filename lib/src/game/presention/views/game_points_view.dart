import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/extensions/context_ext.dart';
import '../../../../core/common/app/riverpod/current_game.dart';
import '../widgets/points_header.dart';
import '../widgets/table.dart';

class GamePointsView extends ConsumerStatefulWidget {
  const GamePointsView({super.key});
  static const path = '/newGame/gamePoints';

  @override
  ConsumerState<GamePointsView> createState() => _GamePointsViewState();
}

class _GamePointsViewState extends ConsumerState<GamePointsView> {
  @override
  Widget build(BuildContext context) {
    final game = ref.watch(currentGameProvider);
    final teams = game.teams;
    final teamA = teams[0];
    final teamB = teams[1];
    final claimedPoints = game.claimedPoint;
    if (teamA.totalScores.isEmpty && teamB.totalScores.isEmpty) {
      teamA.totalScores.add(0);
      teamB.totalScores.add(0);
      claimedPoints.add(0);
    
    }
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

        children: [
          const SizedBox(height: 10),
          PointsHeader(teamA: teamA, teamB: teamB),
          const SizedBox(height: 20),
          SizedBox(
            height: context.height,
            child: PointsTable(teams, claimedPoints),
          ),
        ],
      ),
    );
  }
}
