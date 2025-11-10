import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/context_ext.dart';

import '../../../core/res/styles/color.dart';

class Containers extends StatelessWidget {
  const Containers(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: context.width / 2.5,
        decoration: BoxDecoration(
          color: Colours.onBackgraund,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
