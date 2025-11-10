
import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/context_ext.dart';
import 'package:myapp/core/res/styles/color.dart';

class ScoreCell extends StatelessWidget {
  final int value;
  final bool isPositive;
  final bool hasCrown;
  final Color crownColor;

  const ScoreCell({
     super.key,
    required this.value,
    required this.isPositive,
    required this.hasCrown,
    required this.crownColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 3.1,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$value',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: isPositive ? Colors.black : Colors.red,
            ),
          ),
          if (hasCrown)
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Icon(Icons.king_bed, color: isPositive ? Colours.plusColor : Colours.minusColor, size: 18),
            ),
        ],
      ),
    );
  }
}