// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class CustomColors {
  final Color _activePrimaryButton = const Color.fromARGB(255, 145, 0, 0);
  final Color _activeSecundaryButton = const Color.fromARGB(255, 255, 215, 0);
  final Color _gradientPrimaryColor = const Color.fromARGB(255, 255, 153, 0);
  final Color _gradientSecundaryColor = const Color.fromARGB(255, 145, 0, 0);

  Color getActivePrimaryButton() {
    return _activePrimaryButton;
  }

  Color getActiveSecundaryButton() {
    return _activeSecundaryButton;
  }

  Color getGradientPrimaryColor() {
    return _gradientPrimaryColor;
  }

  Color getGradientSecundaryColor() {
    return _gradientSecundaryColor;
  }
}
