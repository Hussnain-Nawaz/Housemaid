import 'package:flutter/material.dart';

class OTPController {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  // Method to get the full OTP from the 4 input fields
  String getOTP() {
    return otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text;
  }


  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
  }
}
