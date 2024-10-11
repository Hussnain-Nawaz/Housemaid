
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_maid_project/Controllers/forgotpassword/NewpasswordController.dart'; // Import the password controller
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/CustomWidgets/custompasswordfield_createpass.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/forgotPassword/passChanged.dart'; // Custom password field widget

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final PasswordController passwordController =
      PasswordController(); // Initialize the PasswordController

  // Validate passwords and update if valid
  void _updatePassword() {
    if (!passwordController.doPasswordsMatch()) {
      ErrorDialog.showError(context, "Password do not match. Try again later");
      return;
    }

    if (!passwordController.isPasswordStrong()) {
      ErrorDialog.showError(context,
          "Password is too weak. Please use a stronger password (at least 6 characters, with both letters and numbers.");
      return;
    }

    // Password is valid; proceed with the update logic (e.g., API call)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password updated successfully!')),
    );
    Get.to(() => PasswordChangedScreen());
  }

  @override
  void dispose() {
    passwordController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
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
              SizedBox(height: screenHeight * 0.05),
              // Back Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back when tapped
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width:
                      screenWidth * 0.1, // Responsive size for the back button
                  height:
                      screenWidth * 0.1, // Responsive size for the back button
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Create New Password Text
              Text(
                'Create new password',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.08, // Responsive font size
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: -0.32,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              // Subtitle text
              Text(
                'Your new password must be unique from those previously used.',
                style: TextStyle(
                  color: const Color(0xFF8391A1),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // New Password CustomPasswordField
              CustomPasswordField(
                hintText: 'New Password',
                controller: passwordController.newPasswordController,
              ),
              SizedBox(height: screenHeight * 0.02),
              // Confirm Password CustomPasswordField
              CustomPasswordField(
                hintText: 'Confirm Password',
                controller: passwordController.confirmPasswordController,
              ),
              SizedBox(height: screenHeight * 0.03),
              // Update Button
              CustomNextButton(
                text: 'Update',
                onPressed: _updatePassword, // Validate passwords
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
