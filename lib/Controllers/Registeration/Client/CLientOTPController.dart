import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:house_maid_project/APIs/APIsClass.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/address/DataSubmitted.dart';

class ClientOtpController extends GetxController {
  final apiService = APIs(); // Singleton instance of APIs

  // Email and OTP observables
  var email = ''.obs;
  var otp = ''.obs;

  Future<void> verifyOtp(BuildContext context) async {
    try {
      final response = await apiService.clientOtpAPI(
        email: email.value,
        otp: otp.value,
      );

      if (response.statusCode == 201) {
        Get.to(() => SubmittedData());
      } else {
        ErrorDialog.showError(
            context, response.message ?? 'OTP verification failed.');
      }
    } catch (e) {
      ErrorDialog.showError(context, 'An error occurred: $e');
    }
  }
}

class ClientOtpController1 extends GetxController {
  final apiService = APIs(); // Singleton instance of APIs
  var email = ''.obs;
  var otp = ''.obs;

  Future<void> verifyOtp(BuildContext context) async {
    try {
      final response = await apiService.clientOtpAPI(
        email: email.value,
        otp: otp.value,
      );

      if (response.statusCode == 201) {
        Get.to(() => SubmittedData());
      } else {
        ErrorDialog.showError(
            context, response.message ?? 'OTP verification failed.');
      }
    } catch (e) {
      ErrorDialog.showError(context, 'An error occurred: $e');
    }
  }
}


// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:house_maid_project/APIs/APIsClass.dart';
// import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
// import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/address/DataSubmitted.dart';

// class ClientOtpController extends GetxController {
//   var apiService = APIs(); // Initialize the APIs service

//   // Email and OTP variables
//   var email = ''.obs;
//   var otp = ''.obs;

//   // Method to call the OTP verification API
//   Future<void> verifyOtp(BuildContext context) async {
//     // Call the API to verify the OTP
//     try {
//       print('BEfore hitting mail is  $email');
//       print('BEfore hitting otp is  $otp');
//       var response = await apiService.clientOtpAPI(
//         email: email.value,
//         otp: otp.value,
//       );

//       // Handle the response
//       if (response.statusCode == 201) {
//         Get.to(() => SubmittedData());
//         // Get.to(() => IdentityVerifiedScreen());
//       } else if (response.statusCode == 400) {
//         ErrorDialog.showError(context, "Bad Request: Missing or invalid OTP.");
//       } else if (response.statusCode == 500) {
//         ErrorDialog.showError(
//             context, "Internal Server Error: Please try again later.");
//       } else {
//         ErrorDialog.showError(
//             context, response.message ?? "OTP verification failed.");
//       }
//     } catch (e) {
//       ErrorDialog.showError(context, "An error occurred: $e");
//     }
//   }
// }
