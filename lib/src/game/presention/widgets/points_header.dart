import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/extensions/context_ext.dart';
import 'package:myapp/core/res/styles/color.dart';

import '../../../../core/common/entities/team.dart';

class PointsHeader extends ConsumerWidget {
  const PointsHeader({super.key,required this.teamA,required this.teamB});
  final Team teamA;
  final Team teamB;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80,
      width: context.width,
      decoration: BoxDecoration(
        color: Colours.onBackgraund,

        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(teamA.name),
          VerticalDivider(width: 1),
          Text('ادعا'),
          VerticalDivider(width: 1),
          Text(teamB.name),
        ],
      ),
    );
  }
}
