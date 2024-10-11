// import 'dart:async';
// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:house_maid_project/APIs/APIsClass.dart';
// import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
// import 'package:house_maid_project/Views/HomeScreen/client.dart';
// import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/HousemaidBefore.dart';
// import 'package:house_maid_project/Views/login/loginScreen.dart';
// import 'package:path/path.dart';
// import 'package:uni_links3/uni_links.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:get_storage/get_storage.dart'; // For persistent storage

// class GoogleSignInController extends GetxController {
//   final APIs apiService = APIs(); // Initialize your APIs service
//   StreamSubscription? _sub; // Subscription to listen for deep links
//   final box = GetStorage(); // For persistent storage
//   var isLoading = false.obs; // Observable to show/hide loader

//   @override
//   void onInit() {
//     super.onInit();
//     _handleIncomingLinks(); // Listen for deep links when the controller is initialized
//     _handleInitialLink(); // Optionally handle the initial deep link
//   }

//   /// Initiates the Google Sign-In process by getting a redirection URL from the backend.
//   /// Opens the Google consent screen in an external browser.
//   Future<void> initiateGoogleSignIn(BuildContext context, int roleId) async {
//     isLoading.value = true; // Start loading indicator
//     try {
//       // Fetch the Google consent screen URL from your backend
//       final response = await apiService.googleSignInInit(
//           roleId: roleId, deviceId: await _getDeviceId());

//       // Check for successful response
//       if (response.statusCode == 200 || response.statusCode == 302) {
//         print('response code is ${response.statusCode}');
//         // Redirection URL to open Google Sign-In consent screen
//         final Uri googleSignInUrl = Uri.parse(response.data!.url!);

//         // Open the Google Sign-In page in an external browser
//         if (await canLaunchUrl(googleSignInUrl)) {
//           await launchUrl(googleSignInUrl, mode: LaunchMode.inAppBrowserView);
//         } else {
//           throw 'Could not launch $googleSignInUrl';
//         }
//       } else {
//         // Handle error response
//         ErrorDialog.showError(
//             context, response.message ?? "An unexpected error occurred.");
//       }
//     } catch (error) {
//       // Display error message if any exception occurs
//       ErrorDialog.showError(context, "An error occurred: $error");
//     } finally {
//       isLoading.value = false; // Stop loading indicator
//     }
//   }

//   /// Handles incoming deep links after Google consent screen redirection.
//   void _handleIncomingLinks() {
//     _sub = uriLinkStream.listen((Uri? uri) {
//       if (uri != null && uri.scheme == 'housemaid') {
//         // Ensure scheme matches your app's deep link configuration
//         if (uri.host == 'callback') {
//           _processBackendCallback(uri); // Process the deep link callback
//         }
//       }
//     }, onError: (err) {
//       print('Error listening for deep link: $err');
//     });
//   }

//   /// Optionally handle the initial deep link if the app was opened by a deep link.
//   Future<void> _handleInitialLink() async {
//     try {
//       final initialUri = await getInitialUri();
//       if (initialUri != null && initialUri.scheme == 'housemaid') {
//         _processBackendCallback(initialUri);
//       }
//     } on PlatformException catch (e) {
//       print("Failed to receive initial URI: $e");
//     }
//   }

//   /// Processes the backend callback received via deep link.
//   /// Based on the callback parameters (e.g., token, status), it navigates the user to the appropriate screen.
//   void _processBackendCallback(Uri uri) {
//     // Extract parameters from the deep link
//     String? token = uri.queryParameters['bearer_token'];
//     String? status = uri.queryParameters['status'];
//     String? statusCode = uri.queryParameters['statusCode'];
//     String? role_id = uri.queryParameters['role_id'];

//     // Log the received parameters for debugging
//     print('Token: $token, Status: $status, Role ID: $role_id');

//     // Validate the token and status
//     if (token == null || token.isEmpty || status == null) {
//       return;
//     }

//     // Save token in persistent storage
//     _saveToken(token);
//     print('token is ${token}');
//     // Navigate based on the user status
//     if (status == 'true' && statusCode == '200') {
//       Get.off(() => HouseMaidBefore(), arguments: {'token': token});
//     } else if (status == 'true' && statusCode == '201') {
//       Get.off(() => ClientDashboardScreen(), arguments: {'token': token});
//     } else if (status == 'true' && statusCode == '202') {
//       Get.off(() => HouseMaidBefore(), arguments: {'token': token});
//     } else if (status == 'false' && statusCode == '404') {
//       Get.snackbar(
//         'Error', // Title of the snackbar
//         'Registered with different ccount, please login with that', // Message of the snackbar
//         snackPosition:
//             SnackPosition.BOTTOM, // Position of the snackbar (top or bottom)
//         backgroundColor: Colors.redAccent, // Background color
//         colorText: Colors.white, // Text color
//         duration: Duration(
//             seconds: 3), // Duration for which the snackbar will be displayed
//       );
//     } else if (status == 'false' && statusCode == '403') {
//       Get.snackbar(
//         'Error', // Title of the snackbar
//         'You dont have any account against this role', // Message of the snackbar
//         snackPosition:
//             SnackPosition.BOTTOM, // Position of the snackbar (top or bottom)
//         backgroundColor: Colors.redAccent, // Background color
//         colorText: Colors.white, // Text color
//         duration: Duration(
//             seconds: 3), // Duration for which the snackbar will be displayed
//       );
//     }
//     // else if (status == 'incomplete') {
//     //   Get.off(() => HouseMaidBefore(), arguments: {'token': token});
//     //   // You can navigate to a specific profile completion screen if needed:
//     //   // Get.to(() => CompleteProfileScreen(), arguments: {'token': token});
//     // }
//     else {
//       Get.snackbar('Error', 'Unknown status received from deep link');
//     }
//   }

//   /// Saves the authentication token securely using GetStorage.
//   Future<void> _saveToken(String token) async {
//     // Store the token in persistent storage for future API calls
//     box.write('auth_token', token);
//   }

//   /// Retrieves the saved authentication token from persistent storage.
//   String? getToken() {
//     return box.read('auth_token');
//   }

//   /// Fetches the device ID depending on the platform (Android/iOS).
//   Future<String> _getDeviceId() async {
//     String? deviceId;
//     final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

//     try {
//       if (Platform.isAndroid) {
//         AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//         deviceId = androidInfo.id; // Use androidId instead of hardware ID
//       } else if (Platform.isIOS) {
//         IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//         deviceId = iosInfo.identifierForVendor; // Unique iOS device ID
//       }
//     } on PlatformException {
//       print('Failed to get platform version');
//     }

//     return deviceId!;
//   }

//   @override
//   void dispose() {
//     _sub?.cancel(); // Cancel the deep link listener when the controller is disposed
//     super.dispose();
//   }
// }
