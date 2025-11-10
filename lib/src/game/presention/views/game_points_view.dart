import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/common/entities/team.dart';
import 'package:myapp/core/extensions/context_ext.dart';
import '../../../../core/common/app/riverpod/current_game.dart';
import '../widgets/points_header.dart';
import '../widgets/scores_cell.dart';

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
    if (teamA.totalScores.isEmpty && teamB.totalScores.isEmpty) {
      teamA.totalScores.add(0);
      teamB.totalScores.add(0);
    }
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

        children: [
          const SizedBox(height: 10),
          PointsHeader(teamA: teamA, teamB: teamB),
          const SizedBox(height: 20),
          SizedBox(height: context.height,
            child: SingleChildScrollView(
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.grey),
                  verticalInside: BorderSide(color: Colors.grey),
                ),
                columnWidths: const {
                  0: FixedColumnWidth(100),
                  1: FixedColumnWidth(100),
                  2: FixedColumnWidth(100),
                  3: FixedColumnWidth(100),
                },
                children: List.generate(teamA.totalScores.length, (index) {
                  final ourScore = teamA.totalScores[index];
                  final theirScore = teamB.totalScores[index];
                  final diff = teamA.totalScoreSum - teamB.totalScoreSum;
                  final claimedPoint = game.claimedPoint ?? 0;
                  return TableRow(
                    children: [
                      ScoreCell(
                        isPositive: true,
                        crownColor: Colors.red,
                        hasCrown: ourScore > theirScore,
                        value: ourScore,
                      ),
                      _CenterCell(claimedPoint.toString()),
                      ScoreCell(
                        isPositive: true,
                        crownColor: Colors.green,
                        hasCrown: theirScore > ourScore,
                        value: theirScore,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final Team _teamA = Team(
  totalScores: [120, 50, 20, 30, 150],
  totalScoreSum: 360,
  name: 'we',
  id: '1',
);

final Team _teamB = Team(
  totalScores: [140, 40, 50, 10, 150],
  totalScoreSum: 360,
  name: 'them',
  id: '2',
);

class _CenterCell extends StatelessWidget {
  final String text;
  const _CenterCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontSize: 15)),
    );
  }
}
