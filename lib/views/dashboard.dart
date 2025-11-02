import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/riverpod/game_controller.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  final TextEditingController kingPointsController = TextEditingController();
  final TextEditingController otherTeamPointsController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    kingPointsController.dispose();
    otherTeamPointsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int kingPoint;
    final game = ref.watch(gameControllerProvider);
    final controller = ref.read(gameControllerProvider.notifier);

    void showChooseKingDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return Consumer(
            builder: (context, innerRef, _) {
              final game = innerRef.watch(gameControllerProvider);
              final controller = innerRef.read(gameControllerProvider.notifier);

              return AlertDialog(
                title: const Text('انتخاب تیم شاه'),
                content: RadioGroup<String>(
                  groupValue: game.kingTeamId,
                  onChanged: (value) {
                    if (value != null) controller.setKingTeamId(value);
                    debugPrint(value);
                  },
                  child: Column(
                    children: [
                      ...game.teams.map((team) {
                        return RadioListTile<String>(
                          value: team.id,
                          title: Text(team.name),
                        );
                      }),
                      TextField(controller: kingPointsController),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('بستن'),
                  ),
                  TextButton(
                    onPressed: () {
                      kingPoint = int.parse(kingPointsController.text);
                      showDialog(
                        context: context,
                        builder: (ontetxt) {
                          return AlertDialog(
                            content: TextField(
                              controller: otherTeamPointsController,
                            ),
                            title: const Text("امتیاز تیم حریف"),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.calculatePoints(
                                    game.kingTeamId,
                                    kingPoint,
                                    int.parse(otherTeamPointsController.text),
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text('ثبت امتیاز'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('ثبت امیاز'),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      floatingActionButton: ElevatedButton(
        onPressed: showChooseKingDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
