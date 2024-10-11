import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/Views/login/loginScreen.dart'; // Import your custom button

class SubmittedData extends StatelessWidget {
  const SubmittedData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.1), // Spacing from the top
              Image.asset(
                'assets/images/submitted.png', // Your image path
                width: 196,
                height: 191,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40), // Spacing between image and text
              const Text(
                'Identity Verification details Submitted!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(
                  height: 20), // Spacing between title and description
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'You can proceed to the dashboard. we will review and verify you soon.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Urbanist',
                    color: Color(0xFF8391A1),
                    height: 1.25, // Line height: 125%
                  ),
                ),
              ),
              const Spacer(), // Push the button to the bottom
              CustomNextButton(
                text: 'Continue', // Your custom button with text
                onPressed: () {
                  Get.to(() => LoginScreen());
                  // Add navigation or logic here for continue button
                },
              ),
              const SizedBox(
                  height: 30), // Space between the button and the bottom
            ],
          ),
        ),
      ),
    );
  }
}
