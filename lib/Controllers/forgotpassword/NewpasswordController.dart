import 'package:flutter/material.dart';

class PasswordController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Method to check if passwords match
  bool doPasswordsMatch() {
    return newPasswordController.text == confirmPasswordController.text;
  }

  // Updated method to check if password is strong
  bool isPasswordStrong() {
    // Updated regex to include more special characters
    final strongPasswordRegex = RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?])[A-Za-z\d!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?]{6,}$');

    return strongPasswordRegex.hasMatch(newPasswordController.text);
  }

  // Dispose controllers when not needed
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
