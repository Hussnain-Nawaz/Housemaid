import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/CustomWidgets/TextField.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/forgotPassword/otpScreen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  // Method to validate email
  bool _isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    // Getting screen size dynamically
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: screenHeight *
                      0.05), // Spacing for the top, dynamically adjusted
              // Back button using asset
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back when tapped
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.1, // Responsive size for back button
                  height: screenWidth * 0.1, // Responsive size for back button
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              // Forgot Password Text
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.085, // Responsive font size
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: -0.32,
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Responsive spacing
              // Subtitle text
              Text(
                'Don’t worry! It occurs. Please enter the email address linked with your account.',
                style: TextStyle(
                  color: const Color(0xFF8391A1),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Responsive spacing
              // Email TextField
              CustomTextField(
                hintText: 'Enter your email',
                controller: emailController,
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              // Send Code Button
              CustomNextButton(
                text: 'Send Code',
                onPressed: () {
                  String email = emailController.text;
                  // Validate email before proceeding
                  if (email.isEmpty || !_isEmailValid(email)) {
                    ErrorDialog.showError(
                        context, "Please enter a valid email.");
                  } else {
                    Get.to(() => OTPVerificationScreen());
                    // Add the logic for sending code
                  }
                },
              ),
              const Spacer(), // Push the content upwards, keep it centered
            ],
          ),
        ),
      ),
    );
  }
}
