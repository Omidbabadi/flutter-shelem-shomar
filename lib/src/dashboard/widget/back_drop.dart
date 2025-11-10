import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/app/riverpod/current_game.dart';
import '../../game/presention/app/adapter/game_adapter.dart';
import 'containers.dart';

class DashboardBackDrop extends ConsumerWidget {
  const DashboardBackDrop({
    super.key,
    required this.claimedPointController,
    required this.earnedByOtherTeamController,
  });

  final TextEditingController claimedPointController;
  final TextEditingController earnedByOtherTeamController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(currentGameProvider);
    final controller = ref.read(gameAdapterProvider.notifier);

    return RadioGroup<String>(
      groupValue: game.kingTeamId,
      onChanged: (id) {
        if (id != null) controller.setKingTeam(id);
        debugPrint(id);
      },
      child: ListView(
        children: [
          ...game.teams.map((team) {
            // debugPrint(team.id);
            return RadioListTile<String>(
              value: team.id,
              title: Text(team.name),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Containers(
                TextFormField(
                  controller: claimedPointController,
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(label: Text('امیتاز خوانده شده')),
                ),
              ),
              Containers(
                TextFormField(
                  controller: earnedByOtherTeamController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('امتیاز گرفته شده توسط حریف'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
