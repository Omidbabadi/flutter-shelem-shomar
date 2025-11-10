import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/game/presention/app/adapter/game_adapter.dart';
import 'package:myapp/src/home/presention/views/home_view.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

       WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        // مسیر بعدی رو مشخص کن
        context.go(HomeView.path); // یا مثلاً context.go('/home')
      });
    });      

    return const Scaffold(body: Center(child: Text('Shelem')));
  }
}
