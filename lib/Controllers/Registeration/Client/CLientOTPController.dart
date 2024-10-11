import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:house_maid_project/APIs/APIsClass.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/address/DataSubmitted.dart';

class ClientOtpController extends GetxController {
  var apiService = APIs(); // Initialize the APIs service

  // Email and OTP variables
  var email = ''.obs;
  var otp = ''.obs;

  // Method to call the OTP verification API
  Future<void> verifyOtp(BuildContext context) async {
    // Call the API to verify the OTP
    try {
      print('BEfore hitting mail is  $email');
      print('BEfore hitting otp is  $otp');
      var response = await apiService.clientOtpAPI(
        email: email.value,
        otp: otp.value,
      );

      // Handle the response
      if (response.statusCode == 201) {
        Get.to(() => SubmittedData());
        // Get.to(() => IdentityVerifiedScreen());
      } else if (response.statusCode == 400) {
        ErrorDialog.showError(context, "Bad Request: Missing or invalid OTP.");
      } else if (response.statusCode == 500) {
        ErrorDialog.showError(
            context, "Internal Server Error: Please try again later.");
      } else {
        ErrorDialog.showError(
            context, response.message ?? "OTP verification failed.");
      }
    } catch (e) {
      ErrorDialog.showError(context, "An error occurred: $e");
    }
  }
}
