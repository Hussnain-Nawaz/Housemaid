import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_maid_project/Views/login/loginScreen.dart';

class IdentityVerifiedScreen extends StatelessWidget {
  const IdentityVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Image at the top
              Container(
                child: Image.asset(
                  'assets/images/tick.png', // Replace with your image path
                  width: screenWidth * 0.6, // Responsive width
                  height: screenHeight * 0.3, // Responsive height
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              // "Identity Verified" text
              Text(
                'Identity Verified!',
                style: TextStyle(
                  fontSize: screenWidth * 0.07, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              // Description text
              Text(
                'Your email successfully subscribed.\nHire HouseMaide for your home services.',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  color: const Color(0xFF8391A1),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              // Continue Button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFFEB0D9), // Set your app's theme color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(
                      double.infinity,
                      screenHeight *
                          0.07), // Full width button, responsive height
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: screenWidth * 0.045, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
