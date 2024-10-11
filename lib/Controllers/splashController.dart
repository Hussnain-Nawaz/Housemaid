import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreenController {
  Color backgroundColor = const Color(0xFFFEFFFE); // Custom white color
  Color textColor =
      const Color(0xFFFEB0D9); // Custom pink color for text on white background
  String logoAsset =
      'assets/images/pink_logo.png'; // Initial logo for white background

  void startSplashSequence(VoidCallback onTimerComplete) {
    Timer(const Duration(seconds: 2), onTimerComplete);
  }

  void changeSplashAppearance(VoidCallback onTimerComplete) {
    backgroundColor = const Color(0xFFFEB0D9); // Change to custom pink color
    textColor = Colors.white; // Text color for pink background
    logoAsset = 'assets/images/white_logo.png'; // Logo for pink background
    Timer(
        const Duration(seconds: 2), onTimerComplete); // Delay before navigation
  }

  void handleUserNavigation(BuildContext context) {
    // Placeholder navigation logic
    Navigator.pushReplacementNamed(
        context, '/onboarding'); // Always navigate to onboarding for now
  }
}
