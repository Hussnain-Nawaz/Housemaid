import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:house_maid_project/APIs/APIsClass.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/QuestionsScreens/HousemaidBefore.dart';

class HousemaidOTPController extends GetxController {
  var apiService = APIs();
  var email = ''.obs;
  var otp = ''.obs;

  Future<void> verifyOtp(BuildContext context) async {
    try {
      var response = await apiService.clientOtpAPI(
        email: email.value,
        otp: otp.value,
      );

      if (response.statusCode == 200) {
        Get.to(() => HouseMaidBefore());
      } else if (response.statusCode == 409) {
        ErrorDialog.showError(context, 'User Already Exists');
      } else if (response.statusCode == 400) {
        ErrorDialog.showError(
            context, 'Bad Request: Missing or invalid fields.');
      } else if (response.statusCode == 500) {
        ErrorDialog.showError(
            context, 'Internal Server Error. Try again later.');
      } else {
        ErrorDialog.showError(context, 'Unknown error occurred.');
      }
    } catch (e) {
      ErrorDialog.showError(context, "An error occurred: $e");
    }
  }
}
