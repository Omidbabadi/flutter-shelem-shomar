import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/core/extensions/context_ext.dart';
import 'package:myapp/core/res/media.dart';
import 'package:myapp/core/res/styles/color.dart';
import 'package:myapp/src/game/presention/views/new_game_screen.dart';

import '../../../../core/res/styles/text.dart';

class HomeContainers extends StatefulWidget {
  const HomeContainers.first({super.key}) : first = true;
  const HomeContainers.second({super.key}) : first = false;

  final bool first;

  @override
  State<HomeContainers> createState() => _HomeContainersState();
}

class _HomeContainersState extends State<HomeContainers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: switch (widget.first) {
        true => GestureDetector(
          onTap: () => context.go(NewGameScreen.path),
          child: Container(
            height: 120,
            width: context.width,
            decoration: BoxDecoration(
              color: Colours.newGameContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  bottom: 25,
                  right: 20,
                  child: Text(
                    'بازی جدید',
                    style: TextStyles.headingBold3.copyWith(
                      color: Colours.lightThemePrimaryTextColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 25,
                  child: LottieBuilder.asset(
                    Media.newGameContainer,
                    repeat: false,
                  ),
                ),
              ],
            ),
          ),
        ),
        _ => GestureDetector(
          child: Container(
            height: 120,
            width: context.width,
            decoration: BoxDecoration(
              color: Colours.settingsContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  bottom: 25,
                  right: 20,
                  child: Text(
                    'تنظیمات',
                    style: TextStyles.headingBold3.copyWith(
                      color: Colours.lightThemePrimaryTextColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  top: 0,
                  child: LottieBuilder.asset(
                    Media.settingsContainer,
                    repeat: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      },
    );
  }
}
