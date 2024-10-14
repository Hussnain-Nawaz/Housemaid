import 'package:flutter/material.dart';
import 'package:house_maid_project/Controllers/otpstatescontroller.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final OTPController otpController = OTPController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  void dispose() {
    otpController.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  void _verifyOTP() {
    String enteredOTP = otpController.getOTP();
    // if (otpController.verifyOTP(enteredOTP)) {
    //   Get.to(() => CreateNewPasswordScreen());
    // } else {
    //   ErrorDialog.showError(context, "Incorrect OTP.");
    // }
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
              Text(
                'OTP Verification',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.085, // Responsive font size
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: -0.32,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Enter the Verification code we just sent on your phone number.',
                style: TextStyle(
                  color: const Color(0xFF8391A1),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.w500,
                  height: 1.25,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOTPBox(otpController.otpController1, focusNode1,
                      focusNode2, screenWidth, screenHeight),
                  _buildOTPBox(otpController.otpController2, focusNode2,
                      focusNode3, screenWidth, screenHeight),
                  _buildOTPBox(otpController.otpController3, focusNode3,
                      focusNode4, screenWidth, screenHeight),
                  _buildOTPBox(otpController.otpController4, focusNode4, null,
                      screenWidth, screenHeight),
                ],
              ),
              SizedBox(
                  height: screenHeight * 0.05), // Adjusted for larger screens
              CustomNextButton(
                text: 'Continue',
                onPressed: _verifyOTP,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPBox(TextEditingController controller, FocusNode currentNode,
      FocusNode? nextNode, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.2, // Responsive width for the OTP box
      height: screenHeight * 0.08, // Responsive height for the OTP box
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.08),
        border: Border.all(color: const Color(0xFFFEB0D9), width: 2),
        color: const Color.fromRGBO(254, 176, 217, 0.25),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.isNotEmpty && nextNode != null) {
            nextNode
                .requestFocus(); // Move to the next field if a digit is entered
          } else if (value.isEmpty && currentNode != focusNode1) {
            FocusScope.of(context)
                .previousFocus(); // Move to the previous field
          }
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '', // Remove the counter text
        ),
        style: TextStyle(
          fontSize: screenWidth * 0.08, // Responsive font size for OTP digits
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
