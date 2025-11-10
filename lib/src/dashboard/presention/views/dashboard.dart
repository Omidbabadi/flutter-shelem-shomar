import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/common/app/riverpod/current_game.dart';
import 'package:myapp/core/extensions/context_ext.dart';
import 'package:myapp/src/game/presention/app/adapter/game_adapter.dart';
import 'package:myapp/src/game/presention/views/game_points_view.dart';

import '../../widget/back_drop.dart';
import '../utils/dashboard_utils.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key, required this.state, required this.child});
  final GoRouterState state;
  final Widget child;

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  final BoxController boxController = BoxController();
  final TextEditingController claimedPointController = TextEditingController();
  final TextEditingController earnedByOtherTeamController =
      TextEditingController();

  @override
  void dispose() {
    claimedPointController.dispose();
    earnedByOtherTeamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isInGamePointView = widget.state.fullPath == GamePointsView.path;
    final kingId = ref.watch(currentGameProvider).kingTeamId;
    final controller = ref.read(gameAdapterProvider.notifier);
    return Scaffold(
      backgroundColor: Color(0xffF5EFFF),
      key: DashboardUtils.scaffoldKey,
      body: SlidingBox(
        draggable: false,
        backdrop: Backdrop(
          body: DashboardBackDrop(
            claimedPointController: claimedPointController,
            earnedByOtherTeamController: earnedByOtherTeamController,
          )
        ),
        maxHeight: context.height,
        minHeight: context.height / 2,
        controller: boxController,
        onBoxShow: () {},
        body: widget.child,
      ),
      floatingActionButton: isInGamePointView
          ? ElevatedButton(
              onPressed: () {
                switch (boxController.isBoxClosed) {
                  case true:
                    final claimedPoint =
                        int.tryParse(claimedPointController.text) ?? 0;
                    final earnedByOtherTeam =
                        int.tryParse(earnedByOtherTeamController.text) ?? 0;
                    print(kingId);
                    controller.calculatePoint(
                      kingId,
                      claimedPoint,
                      earnedByOtherTeam,
                    );
                    claimedPointController.clear();
                    earnedByOtherTeamController.clear();
                    boxController.openBox();
                    break;
                  case false:
                    boxController.closeBox();
                }
              },
              child: Text('new'),
            )
          : null,
    );
  }
}
