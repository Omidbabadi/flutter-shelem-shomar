import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/entities/team.dart';
import 'center_cell.dart';
import 'scores_cell.dart';

class PointsTable extends ConsumerWidget {
  const PointsTable(this.teams, this.claimedPoints, {super.key});
  final List<Team> teams;
  final List<int> claimedPoints;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamA = teams[0];
    final teamB = teams[1];

    return SingleChildScrollView(
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
          final claimedPoint = claimedPoints[index];
          return TableRow(
            children: [
              ScoreCell(
                isPositive: true,
                crownColor: Colors.red,
                hasCrown: ourScore > theirScore,
                value: ourScore,
              ),
              CenterCell(claimedPoint.toString()),
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
    );
  }
}
