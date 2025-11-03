import 'package:flutter/widgets.dart';
import 'package:myapp/core/extensions/context_ext.dart';

abstract class CoreUtils {
  static Color adabtiveColor(
    BuildContext context, {
    required Color lightModeColor,
    required Color darkModeColor,
  }) {
    return context.isDark ? darkModeColor : lightModeColor;
  }
}
