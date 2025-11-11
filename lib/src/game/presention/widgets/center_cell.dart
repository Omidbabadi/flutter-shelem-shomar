import 'package:flutter/material.dart';

class CenterCell extends StatelessWidget {
  final String text;
  const CenterCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(fontSize: 15)),
    );
  }
}