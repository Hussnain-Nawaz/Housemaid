import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/AModels/RegisterationModel.dart';
import 'package:house_maid_project/APIs/APIsClass.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/ClientRegisteration/otp_client_reg.dart';

class ClientRegistrationController extends GetxController {
  var apiService = APIs(); // Initialize the APIs service

  // Personal information for the client
  var profileType = 0.obs; // Declare profileType as an integer
  var fullName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs; // Loading state variable

  // Method to call the registration API
  Future<void> register(BuildContext context) async {
    if (password.value != confirmPassword.value) {
      ErrorDialog.showError(context, 'Passwords do not match.');
      return;
    }

    // Show loader
    isLoading.value = true;

    try {
      // Call the API to register
      RegisterationModel response = await apiService.registrationAPI(
        roleid: profileType.value,
        fullName: fullName.value,
        email: email.value,
        password: password.value,
      );
      print('STatus COde is ${response.statusCode}');
      // Handle the API response
      if (response.status == true) {
        Get.to(() => OtpClientRegisterationScreen());
      } else if (response.statusCode == 409) {
        ErrorDialog.showError(context, 'User Already Exists');
      } else if (response.statusCode == 400) {
        ErrorDialog.showError(
            context, 'Bad Request: Missing or invalid field(s).');
      } else if (response.statusCode == 500) {
        ErrorDialog.showError(
            context, 'Internal Server Error: Please try again later.');
      } else {
        ErrorDialog.showError(
            context, response.message ?? 'Unknown error occurred');
      }
    } finally {
      // Hide loader after response
      isLoading.value = false;
    }
  }

  // Method to reset fields if needed
  void reset() {
    profileType.value = 0;
    fullName.value = '';
    email.value = '';
    password.value = '';
    confirmPassword.value = '';
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:house_maid_project/AModels/RegisterationModel.dart';
// import 'package:house_maid_project/APIs/APIsClass.dart';
// import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
// import 'package:house_maid_project/Views/RegisterScreens/ClientRegisteration/otp_client_reg.dart'; // Import the RegistrationModel class

// class ClientRegistrationController extends GetxController {
//   var apiService = APIs(); // Initialize the APIs service

//   // Personal information for the client
//   var profileType = 0.obs; // Declare profileType as an integer
//   var fullName = ''.obs;
//   var email = ''.obs;
//   var password = ''.obs;
//   var confirmPassword = ''.obs;

//   // Method to call the registration API
//   Future<void> register(BuildContext context) async {
//     if (password.value != confirmPassword.value) {
//       ErrorDialog.showError(context, 'Passwords do not match.');
//       return;
//     }

//     // Call the API to register
//     RegisterationModel response = await apiService.registrationAPI(
//       roleid: profileType.value,
//       fullName: fullName.value,
//       email: email.value,
//       password: password.value,
//     );
//     print('................${response.statusCode}');

//     //will remove later on
//     // response.status == true;
//     // response.statusCode == 200;
//     // Handle the API response
//     if (response.status == true) {
//       print('Sucesssssssssssssss');
//       // Get.snackbar('Success', response.message ?? "Registration successful");
//       Get.to(() => OtpClientRegisterationScreen());
//       // Proceed to OTP verification screen or next step
//     } else if (response.statusCode == 409) {
//       ErrorDialog.showError(context, 'User Already Exists');
//     } else if (response.statusCode == 400) {
//       ErrorDialog.showError(
//           context, 'Bad Request: Missing or invalid field(s).');
//     } else if (response.statusCode == 500) {
//       ErrorDialog.showError(
//           context, 'Internal Server Error: Please try again later.');
//     } else if (response.statusCode == 404) {
//       // For any other errors
//       ErrorDialog.showError(
//           context, response.message ?? 'Unknown error occurred');
//     }
//   }

//   // Method to reset fields if needed
//   void reset() {
//     profileType.value = 0; // Reset profileType to 0
//     fullName.value = '';
//     email.value = '';
//     password.value = '';
//     confirmPassword.value = '';
//   }
// }
