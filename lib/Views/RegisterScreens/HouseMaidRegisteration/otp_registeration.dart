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
class OtpHousemaidRegisterationScreen extends StatelessWidget {
  HousemaidOTPController housemaidOTPController =
      Get.put(HousemaidOTPController());
  final HousemaidRegistrationController _registrationController =
      Get.find<HousemaidRegistrationController>();
  final OTPController1 otpController = OTPController1();

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  OtpHousemaidRegisterationScreen({super.key});

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
    housemaidOTPController.email = _registrationController.email;
    String enteredOTP = otpController.getOTP();
    housemaidOTPController.otp.value = enteredOTP;
    housemaidOTPController.verifyOtp(context);
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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:house_maid_project/Controllers/Registeration/housemaid/HouseOTPCOntroller.dart';
// import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
// import 'package:house_maid_project/Controllers/otpstatescontroller.dart';
// import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';

// class OtpHousemaidRegisterationScreen extends StatefulWidget {
//   const OtpHousemaidRegisterationScreen({super.key});

//   @override
//   _OtpHousemaidRegisterationScreenState createState() =>
//       _OtpHousemaidRegisterationScreenState();
// }

// class _OtpHousemaidRegisterationScreenState
//     extends State<OtpHousemaidRegisterationScreen> {
//   HousemaidOTPController housemaidOTPController =
//       Get.put(HousemaidOTPController());
//   final HousemaidRegistrationController _registrationController =
//       Get.find<HousemaidRegistrationController>();
//   final OTPController otpController = OTPController();

//   final FocusNode focusNode1 = FocusNode();
//   final FocusNode focusNode2 = FocusNode();
//   final FocusNode focusNode3 = FocusNode();
//   final FocusNode focusNode4 = FocusNode();

//   @override
//   void dispose() {
//     otpController.dispose();
//     focusNode1.dispose();
//     focusNode2.dispose();
//     focusNode3.dispose();
//     focusNode4.dispose();
//     super.dispose();
//   }

//   void _verifyOTP() {
//     housemaidOTPController.email = _registrationController.email;
//     String enteredOTP = otpController.getOTP();
//     housemaidOTPController.otp = enteredOTP.obs;

//     housemaidOTPController.verifyOtp(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get screen size for responsiveness
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: screenHeight * 0.05),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Image.asset(
//                   'assets/images/backbutton.png',
//                   width: screenWidth * 0.09, // Responsive size
//                   height: screenWidth * 0.09, // Responsive size
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.03),
//               Text(
//                 'OTP Verification',
//                 style: TextStyle(
//                   color: const Color(0xFF000000),
//                   fontFamily: 'Urbanist',
//                   fontSize: screenWidth * 0.08, // Responsive font size
//                   fontWeight: FontWeight.w700,
//                   height: 1.3,
//                   letterSpacing: -0.32,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.01),
//               Text(
//                 'Enter the Verification code we just sent on your phone number.',
//                 style: TextStyle(
//                   color: const Color(0xFF8391A1),
//                   fontFamily: 'Urbanist',
//                   fontSize: screenWidth * 0.05, // Responsive font size
//                   fontWeight: FontWeight.w500,
//                   height: 1.25,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.03),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildOTPBox(
//                       otpController.otpController1, focusNode1, focusNode2),
//                   _buildOTPBox(
//                       otpController.otpController2, focusNode2, focusNode3),
//                   _buildOTPBox(
//                       otpController.otpController3, focusNode3, focusNode4),
//                   _buildOTPBox(otpController.otpController4, focusNode4, null),
//                 ],
//               ),
//               SizedBox(height: screenHeight * 0.03),
//               CustomNextButton(
//                 text: 'Continue',
//                 onPressed: _verifyOTP,
//               ),
//               const Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildOTPBox(TextEditingController controller, FocusNode currentNode,
//       FocusNode? nextNode) {
//     // Keep the number centered in the TextField
//     return Container(
//       width: 85,
//       height: 63,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(31.5),
//         border: Border.all(color: const Color(0xFFFEB0D9), width: 2),
//         color: const Color.fromRGBO(254, 176, 217, 0.25),
//       ),
//       child: Center(
//         child: TextField(
//           controller: controller,
//           focusNode: currentNode,
//           textAlign: TextAlign.center,
//           keyboardType: TextInputType.number,
//           maxLength: 1,
//           onChanged: (value) {
//             if (value.isNotEmpty && nextNode != null) {
//               nextNode
//                   .requestFocus(); // Move to the next field if a digit is entered
//             } else if (value.isEmpty && currentNode != focusNode1) {
//               FocusScope.of(context)
//                   .previousFocus(); // Move to the previous field on backspace
//             }
//           },
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//             counterText: '', // Remove the counter text
//           ),
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
