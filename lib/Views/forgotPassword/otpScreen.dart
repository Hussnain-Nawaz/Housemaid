import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/Client/CLientOTPController.dart';
import 'package:house_maid_project/Controllers/Registeration/Client/ClientRegController.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HouseOTPCOntroller.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/Controllers/otpstatescontroller.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/CustomWidgets/keyboard.dart'; // Import custom keyboard

//   _registrationController
//   _clientOtpController
class OTPVerificationScreen extends StatelessWidget {
  // HousemaidOTPController housemaidOTPController =
  //     Get.put(HousemaidOTPController());
  // final HousemaidRegistrationController _registrationController =
  //     Get.find<HousemaidRegistrationController>();
  final OTPController1 otpController = OTPController1();

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  OTPVerificationScreen({super.key});

  void _onKeyboardInput(String input, int index) {
    if (otpController.otpControllers[index].text.isEmpty) {
      otpController.otpControllers[index].text = input;
      if (index < 3) focusNodes[index + 1].requestFocus();
    }
  }

  void _onBackspace(int index) {
    if (otpController.otpControllers[index].text.isNotEmpty) {
      otpController.otpControllers[index].clear();
    } else if (index > 0) {
      focusNodes[index - 1].requestFocus();
      otpController.otpControllers[index - 1]
          .clear(); // Clear the previous field immediately
    }
  }

  void _verifyOTP(BuildContext context) {
    // housemaidOTPController.email = _registrationController.email;
    // String enteredOTP = otpController.getOTP();
    // housemaidOTPController.otp.value = enteredOTP;
    // housemaidOTPController.verifyOtp(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.09,
                  height: screenWidth * 0.09,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Enter the verification code sent to your phone number.',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return _buildOTPBox(index);
                }),
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomNextButton(
                text: 'Continue',
                onPressed: () => _verifyOTP(context),
              ),
              const Spacer(),
              CustomKeyboard(
                onTextInput: (input) {
                  final currentIndex =
                      focusNodes.indexWhere((node) => node.hasFocus);
                  _onKeyboardInput(input, currentIndex);
                },
                onBackspace: () {
                  final currentIndex =
                      focusNodes.indexWhere((node) => node.hasFocus);
                  _onBackspace(currentIndex);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPBox(int index) {
    return Container(
      width: 85,
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(31.5),
        border: Border.all(color: const Color(0xFFFEB0D9), width: 2),
        color: const Color.fromRGBO(254, 176, 217, 0.25),
      ),
      child: Center(
        child: TextField(
          controller: otpController.otpControllers[index],
          focusNode: focusNodes[index],
          textAlign: TextAlign.center,
          showCursor: true, // Ensure cursor is visible
          autofocus: true, // Enable cursor focus automatically
          readOnly: true, // Prevent system keyboard from opening
          onTap: () => focusNodes[index].requestFocus(), // Ensure focus on tap
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
