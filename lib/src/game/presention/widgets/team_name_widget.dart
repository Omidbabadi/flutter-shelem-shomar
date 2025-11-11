import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/common/app/riverpod/current_game.dart';
import 'package:myapp/core/extensions/context_ext.dart';
import 'package:myapp/core/res/styles/color.dart';

import '../../../dashboard/widget/containers.dart';

//TODO: change team logic

class TeamNameWidget extends ConsumerWidget {
  const TeamNameWidget({super.key,
  required this.teamAController,
  required this.teamBController
  });
  final TextEditingController teamAController;
  final TextEditingController teamBController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(currentGameProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Containers(
       Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('انتخاب نام تیم ها'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...game.teams.map((e) {
                  return SizedBox(
                    width: context.width / 2.5,
                    child: TextFormField(
                      controller: e.id == '1' ? teamAController : teamBController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'تیم ${e.id}',
                        fillColor: Colors.deepPurpleAccent,
                        border: OutlineInputBorder(
                          gapPadding: 2,
                          borderSide: BorderSide(
                            color: Colours.lightThemePrimaryTextColor,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colours.lightThemePrimaryTextColor,
                            width: 1.0,
                          ),
                        ),
                        hintText: e.name,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
