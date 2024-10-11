import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ErrorDialog {
  static void showError(BuildContext context, String errorMessage) {
    // Ensure context is valid and dialog is being shown after MaterialApp is built
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      headerAnimationLoop: false,
      animType: AnimType.scale,
      title: 'Error',
      desc: errorMessage,
      btnOkOnPress: () {},
      btnOkColor: const Color(0xFFFEB0D9), // Your theme color
    ).show();
  }
}
