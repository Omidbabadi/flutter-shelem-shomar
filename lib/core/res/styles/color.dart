import 'package:flutter/material.dart';

import '../../utils/core_utils.dart';

abstract class Colours {
  static const Color lightBackgroundColor = Colors.white;
  static const Color darkBackgroundColor = Color(0xFF0E1116);
  static const Color lightThemePrimaryTextColor = Color(0xff2A2B2A);
  static const Color darkThemePrimaryTextColor = Color(0xffF4F1DE);
  static const Color onBackgraund = Color(0xffFFFFFF);
  static const Color newGameContainer = Color(0xff06D6A0);
  static const Color settingsContainer = Color(0xFF54C6EB);
  static const Color minusColor = Color(0xFF96031A);
  static const Color plusColor = Color(0xFF21FFB5);

  static Color classicAdabtiveTextColor(BuildContext context) =>
      CoreUtils.adabtiveColor(
        context,
        lightModeColor: lightThemePrimaryTextColor,
        darkModeColor: darkThemePrimaryTextColor,
      );
}
