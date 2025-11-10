import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/common/app/riverpod/current_game.dart';
import 'package:myapp/src/game/presention/app/adapter/game_adapter.dart';
import 'package:myapp/src/game/presention/views/game_points_view.dart';
import 'package:myapp/src/home/presention/views/home_view.dart';

import '../widgets/team_name_widget.dart';

class NewGameScreen extends ConsumerStatefulWidget {
  const NewGameScreen({super.key});
  static const path = '/newgame/setting';

  @override
  ConsumerState<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends ConsumerState<NewGameScreen> {
  final TextEditingController teamAController = TextEditingController();
  final TextEditingController teamBController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    teamAController.dispose();
    teamBController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final game = ref.watch(currentGameProvider);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 12),
        //team names selection
        TeamNameWidget(
          teamAController: teamAController,
          teamBController: teamBController,
        ),
        //end game point selection
        Container(),
        // next or cancel
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(HomeView.path);
              },
              child: const Text('باز گشت'),
            ),
            ElevatedButton(
              onPressed: () {
                if (teamAController.text.isEmpty &&
                    teamBController.text.isEmpty) {
                  print(game.teams[0].name);
                  print(game.teams[1].name);
                  context.go(GamePointsView.path);
                  return;
                } else if (teamAController.text.isEmpty) {
                  teamAController.text = game.teams[0].name;
                } else if (teamAController.text.isEmpty) {
                  teamBController.text = game.teams[1].name;
                }

                game.teams.map((e) {
                  ref
                      .read(gameAdapterProvider.notifier)
                      .editTeamName(
                        e.id,
                        e.id == '1'
                            ? teamAController.text
                            : teamBController.text,
                      );
                });
                context.go(GamePointsView.path);
              },
              child: const Text('شروع بازی'),
            ),
          ],
        ),
      ],
    );
  }
}
