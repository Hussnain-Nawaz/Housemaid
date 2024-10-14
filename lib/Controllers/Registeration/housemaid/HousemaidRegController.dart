import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:house_maid_project/APIs/APIsClass.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/otp_registeration.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/address/DataSubmitted.dart';

class HousemaidRegistrationController extends GetxController {
  // Variables for start and end times for each day of the week
  var mondayStartTime = ''.obs;
  var mondayEndTime = ''.obs;
  var tuesdayStartTime = ''.obs;
  var tuesdayEndTime = ''.obs;
  var wednesdayStartTime = ''.obs;
  var wednesdayEndTime = ''.obs;
  var thursdayStartTime = ''.obs;
  var thursdayEndTime = ''.obs;
  var fridayStartTime = ''.obs;
  var fridayEndTime = ''.obs;
  var saturdayStartTime = ''.obs;
  var saturdayEndTime = ''.obs;
  var sundayStartTime = ''.obs;
  var sundayEndTime = ''.obs;

  // Observable fields for other user data
  var profileType = 0.obs;
  var fullName = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var answer1 = ''.obs;
  var answer2 = ''.obs;
  var answer3 = ''.obs;
  var answer4 = ''.obs;

  var hourlyRate = 0.obs;
  var country = ''.obs;
  var identityType = ''.obs;

  var licenseFrontImage = Rx<File?>(null);
  var licenseBackImage = Rx<File?>(null);
  var selfieWithLicenseImage = Rx<File?>(null);
  var addressProofPDF = Rx<File?>(null);
  var vaccinationProofPDF = Rx<File?>(null);

  var apiService = APIs();
  var isLoading = false.obs; // Loading state variable

  // Basic Registration API with loading and error handling
  Future<void> basicRegistrationAPI({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required int roleid,
  }) async {
    try {
      // Show loader
      isLoading.value = true;

      // Send data to the basic registration API
      var response = await apiService.registrationAPI(
        fullName: name,
        email: email,
        password: password,
        roleid: roleid,
      );

      // Handle API response
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Registration successful!');
        Get.to(() => OtpHousemaidRegisterationScreen());
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
    } catch (e) {
      ErrorDialog.showError(Get.context!, 'An error occurred: $e');
    } finally {
      // Hide loader after response or error
      isLoading.value = false;
    }
  }

  // Submit all fields, including schedule, answers, and documents, with error handling
  Future<void> submitAllFields(BuildContext context) async {
    try {
      // Show loader
      isLoading.value = true;

      // Create a formatted schedule array
      List<Map<String, String>> formattedSchedule = [
        {
          'day': 'Monday',
          'start_time': mondayStartTime.value,
          'end_time': mondayEndTime.value
        },
        {
          'day': 'Tuesday',
          'start_time': tuesdayStartTime.value,
          'end_time': tuesdayEndTime.value
        },
        {
          'day': 'Wednesday',
          'start_time': wednesdayStartTime.value,
          'end_time': wednesdayEndTime.value
        },
        {
          'day': 'Thursday',
          'start_time': thursdayStartTime.value,
          'end_time': thursdayEndTime.value
        },
        {
          'day': 'Friday',
          'start_time': fridayStartTime.value,
          'end_time': fridayEndTime.value
        },
        {
          'day': 'Saturday',
          'start_time': saturdayStartTime.value,
          'end_time': saturdayEndTime.value
        },
        {
          'day': 'Sunday',
          'start_time': sundayStartTime.value,
          'end_time': sundayEndTime.value
        },
      ];

      // Prepare answers and documents
      List<String> answers = [
        answer1.value,
        answer2.value,
        answer3.value,
        answer4.value
      ];

      List<Map<String, String>> documents = [
        if (licenseFrontImage.value != null)
          {"type": "License Front", "path": licenseFrontImage.value!.path},
        if (licenseBackImage.value != null)
          {"type": "License Back", "path": licenseBackImage.value!.path},
        if (selfieWithLicenseImage.value != null)
          {
            "type": "Selfie With License",
            "path": selfieWithLicenseImage.value!.path
          },
        if (addressProofPDF.value != null)
          {"type": "Address Proof", "path": addressProofPDF.value!.path},
        if (vaccinationProofPDF.value != null)
          {
            "type": "Vaccination Proof",
            "path": vaccinationProofPDF.value!.path
          },
      ];

      // Submit data to the API
      var response = await apiService.submitHousemaidDetails(
        password: password.value,
        roleid: profileType.value,
        email: email.value,
        questions: answers,
        answers: answers,
        schedule: formattedSchedule,
        hourlyRate: hourlyRate.value,
        currency: "\$",
        country: country.value,
        identityType: 'Driving License',
        documents: documents,
      );

      // Handle API response
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Details submitted successfully!');
        Get.to(() => SubmittedData());
      } else {
        ErrorDialog.showError(
            context, 'Failed to submit details: ${response.message}');
      }
    } catch (e) {
      ErrorDialog.showError(context, 'An error occurred: $e');
    } finally {
      // Hide loader after response or error
      isLoading.value = false;
    }
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:house_maid_project/AModels/RegisterationModel.dart';
// import 'dart:io';
// import 'package:house_maid_project/APIs/APIsClass.dart';
// import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
// import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/otp_registeration.dart';

// class HousemaidRegistrationController extends GetxController {
//   // Observable schedule for 7 days, each with day, start_time, and end_time
//   var schedule = <Map<String, dynamic>>[].obs;

//   // Observable fields for user data
//   var profileType = 0.obs;
//   var fullName = ''.obs;
//   var email = ''.obs;
//   var password = ''.obs;
//   var confirmPassword = ''.obs;
//   var answer1 = ''.obs;
//   var answer2 = ''.obs;
//   var answer3 = ''.obs;
//   var answer4 = ''.obs;

//   // Observable fields for additional data
//   var hourlyRate = 0.obs;
//   var country = ''.obs;
//   var identityType = ''.obs;

//   // Observable fields for files and images
//   var licenseFrontImage = Rx<File?>(null);
//   var licenseBackImage = Rx<File?>(null);
//   var selfieWithLicenseImage = Rx<File?>(null);
//   var addressProofPDF = Rx<File?>(null);
//   var vaccinationProofPDF = Rx<File?>(null);

//   var apiService = APIs();

//   @override
//   void onInit() {
//     super.onInit();
//     initSchedule();
//   }

//   // Initializes the schedule with 7 days
//   void initSchedule() {
//     schedule.value = [
//       {'day': 'Monday', 'startTime': '', 'endTime': ''},
//       {'day': 'Tuesday', 'startTime': '', 'endTime': ''},
//       {'day': 'Wednesday', 'startTime': '', 'endTime': ''},
//       {'day': 'Thursday', 'startTime': '', 'endTime': ''},
//       {'day': 'Friday', 'startTime': '', 'endTime': ''},
//       {'day': 'Saturday', 'startTime': '', 'endTime': ''},
//       {'day': 'Sunday', 'startTime': '', 'endTime': ''},
//     ];
//   }

//   // Set the schedule received from the screen
//   void setSchedule(List<Map<String, dynamic>> newSchedule) {
//     schedule.value = newSchedule;
//     print('Formatted Schedule in Controller: $schedule');
//   }

//   Future<void> submitAllFields(BuildContext context) async {
//     print('Starting submission...');

//     // No need to reformat or fetch values again, use the already set `schedule`
//     List<Map<String, String>> formattedSchedule = schedule.map((daySchedule) {
//       return {
//         'day': daySchedule['day'] as String,
//         'start_time': daySchedule['startTime'] != null
//             ? (daySchedule['startTime'] as TimeOfDay).format(context)
//             : '',
//         'end_time': daySchedule['endTime'] != null
//             ? (daySchedule['endTime'] as TimeOfDay).format(context)
//             : ''
//       };
//     }).toList();

//     // Print the formatted schedule for debugging
//     print('Formatted Schedule for API: $formattedSchedule');

//     // Check if formattedSchedule contains correct values
//     for (var day in formattedSchedule) {
//       print(
//           'Day: ${day['day']}, Start Time: ${day['start_time']}, End Time: ${day['end_time']}');
//     }

//     // Answers to predefined questions
//     List<String> answers = [
//       answer1.value,
//       answer2.value,
//       answer3.value,
//       answer4.value,
//     ];

//     // Documents to be submitted
//     List<Map<String, String>> documents = [
//       if (licenseFrontImage.value != null)
//         {"type": "License Front", "path": licenseFrontImage.value!.path},
//       if (licenseBackImage.value != null)
//         {"type": "License Back", "path": licenseBackImage.value!.path},
//       if (selfieWithLicenseImage.value != null)
//         {
//           "type": "Selfie With License",
//           "path": selfieWithLicenseImage.value!.path
//         },
//       if (addressProofPDF.value != null)
//         {"type": "Address Proof", "path": addressProofPDF.value!.path},
//       if (vaccinationProofPDF.value != null)
//         {"type": "Vaccination Proof", "path": vaccinationProofPDF.value!.path},
//     ];

//     print(
//         "Submitting all details to API, including formatted schedule: $formattedSchedule");

//     // Call API to submit the full details
//     var response = await apiService.submitHousemaidDetails(
//       roleid: profileType.value,
//       email: email.value,
//       questions: answers, // Placeholder for predefined questions
//       answers: answers,
//       schedule: formattedSchedule, // Use the correctly formatted schedule
//       hourlyRate: hourlyRate.value.toDouble(),
//       currency: "\$",
//       country: country.value,
//       identityType: identityType.value,
//       documents: documents,
//     );

//     // Handle the API response
//     if (response.statusCode == 200) {
//       Get.snackbar('Success', 'Details submitted successfully!');
//       Get.to(() => OtpHousemaidRegisterationScreen());
//     } else {
//       ErrorDialog.showError(
//           context, 'Failed to submit details: ${response.message}');
//     }
//   }

//   // Register user with basic fields (fullName, email, password)
//   Future<void> registerWithBasicFields(BuildContext context) async {
//     // Validate if passwords match
//     if (password.value != confirmPassword.value) {
//       Get.snackbar('Error', 'Passwords do not match');
//       return;
//     }

//     // Call the API to register using profileType, fullName, email, and password
//     RegisterationModel response = await apiService.registrationAPI(
//       roleid: profileType.value,
//       fullName: fullName.value,
//       email: email.value,
//       password: password.value,
//     );

//     print("Response Status Code: ${response.statusCode}");

//     // Handle the API response
//     if (response.status == true) {
//       Get.snackbar('Success', response.message ?? "Registration successful");
//       Get.to(() => OtpHousemaidRegisterationScreen());
//     } else if (response.statusCode == 409) {
//       ErrorDialog.showError(context, 'User Already Exists');
//     } else if (response.statusCode == 400) {
//       ErrorDialog.showError(
//           context, 'Bad Request: Missing or invalid field(s).');
//     } else if (response.statusCode == 500) {
//       ErrorDialog.showError(
//           context, 'Internal Server Error: Please try again later.');
//     } else {
//       ErrorDialog.showError(
//           context, response.message ?? 'Unknown error occurred');
//     }
//   }

//   // Reset all fields to their initial state
//   void reset() {
//     profileType.value = 0;
//     fullName.value = '';
//     email.value = '';
//     password.value = '';
//     confirmPassword.value = '';
//     answer1.value = '';
//     answer2.value = '';
//     answer3.value = '';
//     answer4.value = '';
//     initSchedule();
//     hourlyRate.value = 0;
//     country.value = '';
//     identityType.value = '';
//     licenseFrontImage.value = null;
//     licenseBackImage.value = null;
//     selfieWithLicenseImage.value = null;
//     addressProofPDF.value = null;
//     vaccinationProofPDF.value = null;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'dart:io';
// import 'package:house_maid_project/AModels/RegisterationModel.dart';
// import 'package:house_maid_project/APIs/APIsClass.dart';
// import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
// import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/otp_registeration.dart';

// class HousemaidRegistrationController extends GetxController {
//   // Observable schedule for 7 days, each with day, start_time, and end_time
//   var schedule = <Map<String, String>>[].obs;
//   // Set the schedule received from the screen
// void setSchedule(List<Map<String, String>> formattedSchedule) {
//   schedule.value = formattedSchedule;
//   print('Formatted Schedule in Controller: $schedule');
// }

//   // Observable fields for user data
//   var profileType = 0.obs;
//   var fullName = ''.obs;
//   var email = ''.obs;
//   var password = ''.obs;
//   var confirmPassword = ''.obs;
//   var answer1 = ''.obs;
//   var answer2 = ''.obs;
//   var answer3 = ''.obs;
//   var answer4 = ''.obs;

//   // Observable fields for additional data
//   var hourlyRate = 0.obs;
//   var country = ''.obs;
//   var identityType = ''.obs;

//   // Observable fields for files and images
//   var licenseFrontImage = Rx<File?>(null);
//   var licenseBackImage = Rx<File?>(null);
//   var selfieWithLicenseImage = Rx<File?>(null);
//   var addressProofPDF = Rx<File?>(null);
//   var vaccinationProofPDF = Rx<File?>(null);

//   // API service for making API calls
//   var apiService = APIs();

//   // Initialize the controller with schedule setup
//   @override
//   void onInit() {
//     super.onInit();
//     initSchedule();
//   }

//   // Initializes the schedule with 7 days
//   void initSchedule() {
//     schedule.value = [
//       {'day': 'Monday', 'start_time': '', 'end_time': ''},
//       {'day': 'Tuesday', 'start_time': '', 'end_time': ''},
//       {'day': 'Wednesday', 'start_time': '', 'end_time': ''},
//       {'day': 'Thursday', 'start_time': '', 'end_time': ''},
//       {'day': 'Friday', 'start_time': '', 'end_time': ''},
//       {'day': 'Saturday', 'start_time': '', 'end_time': ''},
//       {'day': 'Sunday', 'start_time': '', 'end_time': ''},
//     ];
//   }

//   // Set the schedule received from the screen
//   void setSchedule(List<Map<String, String>> formattedSchedule) {
//     schedule.value = formattedSchedule;
//     print('Formatted Schedule in Controller: $schedule');
//   }

//   // Register user with basic fields (fullName, email, password)
//   Future<void> registerWithBasicFields(BuildContext context) async {
//     // Validate if passwords match
//     if (password.value != confirmPassword.value) {
//       Get.snackbar('Error', 'Passwords do not match');
//       return;
//     }

//     // Call the API to register using profileType, fullName, email, and password
//     RegisterationModel response = await apiService.registrationAPI(
//       roleid: profileType.value,
//       fullName: fullName.value,
//       email: email.value,
//       password: password.value,
//     );
//     print("Response Status Code: ${response.statusCode}");

//     // Handle the API response
//     if (response.status == true) {
//       Get.snackbar('Success', response.message ?? "Registration successful");
//       Get.to(() => OtpHousemaidRegisterationScreen());
//     } else if (response.statusCode == 409) {
//       ErrorDialog.showError(context, 'User Already Exists');
//     } else if (response.statusCode == 400) {
//       ErrorDialog.showError(
//           context, 'Bad Request: Missing or invalid field(s).');
//     } else if (response.statusCode == 500) {
//       ErrorDialog.showError(
//           context, 'Internal Server Error: Please try again later.');
//     } else {
//       ErrorDialog.showError(
//           context, response.message ?? 'Unknown error occurred');
//     }
//   }

//   // Submit the full details including schedule, answers, and documents to the API
//   Future<void> submitAllFields(BuildContext context) async {
//     // Ensure schedule has valid times before submitting
//     for (var day in schedule) {
//       if (day['start_time'] == '' || day['end_time'] == '') {
//         ErrorDialog.showError(
//             context, "Please select start and end times for all days.");
//         return;
//       }
//     }

//     // Answers to predefined questions
//     List<String> answers = [
//       answer1.value,
//       answer2.value,
//       answer3.value,
//       answer4.value,
//     ];

//     // Documents to be submitted
//     List<Map<String, String>> documents = [
//       if (licenseFrontImage.value != null)
//         {"type": "License Front", "path": licenseFrontImage.value!.path},
//       if (licenseBackImage.value != null)
//         {"type": "License Back", "path": licenseBackImage.value!.path},
//       if (selfieWithLicenseImage.value != null)
//         {
//           "type": "Selfie With License",
//           "path": selfieWithLicenseImage.value!.path
//         },
//       if (addressProofPDF.value != null)
//         {"type": "Address Proof", "path": addressProofPDF.value!.path},
//       if (vaccinationProofPDF.value != null)
//         {"type": "Vaccination Proof", "path": vaccinationProofPDF.value!.path},
//     ];

//     print("Submitting all details to API, including schedule: $schedule");

//     // Call API to submit the full details
//     var response = await apiService.submitHousemaidDetails(
//       roleid: profileType.value,
//       email: email.value,
//       questions: answers, // Placeholder for predefined questions
//       answers: answers,
//       schedule: schedule,
//       hourlyRate: hourlyRate.value.toDouble(),
//       currency: "\$",
//       country: country.value,
//       identityType: identityType.value,
//       documents: documents,
//     );

//     // Handle the API response
//     if (response.statusCode == 200) {
//       Get.snackbar('Success', 'Details submitted successfully!');
//       Get.to(() => OtpHousemaidRegisterationScreen());
//     } else {
//       ErrorDialog.showError(
//           context, 'Failed to submit details: ${response.message}');
//     }
//   }

//   // Reset all fields to their initial state
//   void reset() {
//     profileType.value = 0;
//     fullName.value = '';
//     email.value = '';
//     password.value = '';
//     confirmPassword.value = '';
//     answer1.value = '';
//     answer2.value = '';
//     answer3.value = '';
//     answer4.value = '';
//     initSchedule();
//     hourlyRate.value = 0;
//     country.value = '';
//     identityType.value = '';
//     licenseFrontImage.value = null;
//     licenseBackImage.value = null;
//     selfieWithLicenseImage.value = null;
//     addressProofPDF.value = null;
//     vaccinationProofPDF.value = null;
//   }

// }

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // // Import the RegistrationModel class
// // import 'dart:io';
// // import 'package:house_maid_project/AModels/RegisterationModel.dart';
// // import 'package:house_maid_project/APIs/APIsClass.dart';
// // import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
// // import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/otp_registeration.dart';

// // class HousemaidRegistrationController extends GetxController {
// //   // Profile type
// //   var profileType = 0.obs; // Observable integer

// //   // Personal information
// //   var fullName = ''.obs;
// //   var email = ''.obs;
// //   var password = ''.obs;
// //   var confirmPassword = ''.obs;

// //   // Answers to the 4 questions
// //   var answer1 = ''.obs;
// //   var answer2 = ''.obs;
// //   var answer3 = ''.obs;
// //   var answer4 = ''.obs;

// //   // Schedule array for 7 days with day name, start time, and end time
// //   var schedule =
// //       <Map<String, dynamic>>[].obs; // Initialize as an empty observable list

// //   // Hourly rate
// //   var hourlyRate = 0.obs;

// //   // Country name
// //   var country = ''.obs;

// //   // Identity type
// //   var identityType = ''.obs;

// //   // License images (front, back, and selfie)
// //   var licenseFrontImage = Rx<File?>(null);
// //   var licenseBackImage = Rx<File?>(null);
// //   var selfieWithLicenseImage = Rx<File?>(null);

// //   // PDF files
// //   var addressProofPDF = Rx<File?>(null);
// //   var vaccinationProofPDF = Rx<File?>(null);

// //   // API Service
// //   var apiService = APIs(); // Instantiate the API service

// //   // Constructor
// //   HousemaidRegistrationController() {
// //     initSchedule(); // Initialize schedule in the constructor
// //   }

// //   // Method to initialize schedule with day names and null times
// //   void initSchedule() {
// //     schedule.value = List<Map<String, dynamic>>.generate(
// //       7,
// //       (index) => {
// //         'day': _getDayName(index), // Add day name
// //         'startTime': null, // Initialize startTime as null
// //         'endTime': null, // Initialize endTime as null
// //       },
// //     );
// //   }

// //   Method to call the registration API with basic fields
// //   Future<void> registerWithBasicFields(BuildContext context) async {
// //     // Validate if passwords match
// //     if (password.value != confirmPassword.value) {
// //       Get.snackbar('Error', 'Passwords do not match');
// //       return;
// //     }

// //     // Call the API to register using profileType, fullName, email, and password
// //     RegisterationModel response = await apiService.registrationAPI(
// //       roleid: profileType.value,
// //       fullName: fullName.value,
// //       email: email.value,
// //       password: password.value,
// //     );
// //     print("REsponse is .....................${response.statusCode}");
// //     // Handle the API response
// //     if (response.status == true) {
// //       Get.snackbar('Success', response.message ?? "Registration successful");
// //       Get.to(() => OtpHousemaidRegisterationScreen());
// //       // Proceed to next steps such as verification or further details
// //     } else if (response.statusCode == 409) {
// //       ErrorDialog.showError(context, 'User Already Exists');
// //     } else if (response.statusCode == 400) {
// //       ErrorDialog.showError(
// //           context, 'Bad Request: Missing or invalid field(s).');
// //     } else if (response.statusCode == 500) {
// //       ErrorDialog.showError(
// //           context, 'Internal Server Error: Please try again later.');
// //     } else if (response.statusCode == 404) {
// //       // For any other errors
// //       ErrorDialog.showError(
// //           context, response.message ?? 'Unknown error occurred');
// //     }
// //   }

// //   // Method to reset all fields (if needed)
// //   void reset() {
// //     profileType.value = 0;
// //     fullName.value = '';
// //     email.value = '';
// //     password.value = '';
// //     confirmPassword.value = '';
// //     answer1.value = '';
// //     answer2.value = '';
// //     answer3.value = '';
// //     answer4.value = '';
// //     initSchedule(); // Reset schedule by reinitializing
// //     hourlyRate.value = 0;
// //     country.value = '';
// //     identityType.value = '';
// //     licenseFrontImage.value = null;
// //     licenseBackImage.value = null;
// //     selfieWithLicenseImage.value = null;
// //     addressProofPDF.value = null;
// //     vaccinationProofPDF.value = null;
// //   }

// //   // Get day name based on index
// //   String _getDayName(int index) {
// //     switch (index) {
// //       case 0:
// //         return 'Monday';
// //       case 1:
// //         return 'Tuesday';
// //       case 2:
// //         return 'Wednesday';
// //       case 3:
// //         return 'Thursday';
// //       case 4:
// //         return 'Friday';
// //       case 5:
// //         return 'Saturday';
// //       case 6:
// //         return 'Sunday';
// //       default:
// //         return '';
// //     }
// //   }

// //   // Additional methods for managing profile data will be added later, such as full registration
// // }
