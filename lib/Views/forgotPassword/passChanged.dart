import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/Views/login/loginScreen.dart'; // Custom button widget

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image from assets
              Image.asset(
                'assets/images/passChanged.png', // Replace with your asset name
                width: 128, // As per your provided dimensions
                height: 128,
              ),
              const SizedBox(
                  height: 30), // Space between the image and the text
              // Password Changed Text
              const Text(
                'Password Changed!',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  height: 1.3, // Line height 130%
                  letterSpacing: -0.28,
                ),
                textAlign: TextAlign.center, // Moved to the correct place
              ),
              const SizedBox(height: 10),
              // Description Text
              const Text(
                'Your password has been changed successfully.',
                style: TextStyle(
                  color: Color(0xFF8391A1),
                  fontFamily: 'Urbanist',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.25, // Line height 125%
                ),
                textAlign: TextAlign.center, // Moved to the correct place
              ),
              const SizedBox(height: 40), // Space between text and button
              // Back to Login Button
              CustomNextButton(
                text: 'Back to Login',
                onPressed: () {
                  Get.to(() => LoginScreen());
                  // Navigate to the login screen
                  // Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
