import 'package:flutter/material.dart';

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
}
