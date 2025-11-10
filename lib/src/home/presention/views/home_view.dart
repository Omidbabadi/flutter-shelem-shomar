import 'package:flutter/material.dart';
import 'package:myapp/src/home/presention/widgets/home_containers.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const path = '/home';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        HomeContainers.first(),
        const SizedBox(height: 20),
        HomeContainers.second(),
      ],
    );
  }
}
