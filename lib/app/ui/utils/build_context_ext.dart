import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension BuilbContextExt on BuildContext {
  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }

  Size get mediaQuerySize {
    return MediaQuery.of(this).size;
  }

  void showSnackbar(
    Widget content, {
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: content,
        duration: duration,
      ),
    );
  }

  void showTopBanner(
    Widget content, {
    Duration duration = const Duration(seconds: 1),
    ControllerCallback? onAnimationControllerInit,
  }) {
    showTopSnackBar(
      Overlay.of(this)!,
      content,
      displayDuration: duration,
      onAnimationControllerInit: onAnimationControllerInit,
    );
  }
}
