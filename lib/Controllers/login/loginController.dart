import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:house_maid_project/APIs/APIsClass.dart'; // Import your API service
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/Dashboard/housemaid.dart/homepage.dart';
import 'package:house_maid_project/Views/HomeScreen/client.dart';
import 'package:house_maid_project/Views/HomeScreen/housemaid.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/address/DataSubmitted.dart'; // Import loginModel

class LoginController extends GetxController {
  var apiService = APIs(); // Initialize the APIs class
  var isLoading = false.obs; // Observable to track loading state

  Future<String> _getDeviceId() async {
    String? deviceId;
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id; // Use androidId instead of hardware ID
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor; // Unique iOS device ID
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

    return deviceId!;
  }

  void login(
      String email, String password, int roleid, BuildContext context) async {
    isLoading.value = true; // Set loading to true when API call starts

    try {
      // Call the login API from your ApiService and await the loginModel response
      var response = await apiService.login(
          email: email,
          password: password,
          roleid: roleid,
          deviceid: await _getDeviceId());

      // Handle different status codes and responses
      if (response.statusCode == 200 && response.data!.roleName == 'client') {
        // Successful login
        ErrorDialog.showError(context,
            'Client Dashboard is under development.. Will be delivered soon in next  update.');

        Get.to(() => HouseMaidDashboard());
      } else if (response.statusCode == 200 &&
          response.data!.roleName == 'housemaid') {
        // Role does not exist
        Get.to(() => HouseMaidDashboard());
      } else if (response.statusCode == 403) {
        // Role does not exist
        ErrorDialog.showError(context, '${response.message}');
      } else if (response.statusCode == 401) {
        if (response.message ==
            'Login failed. already account exists against this email') {
          print('${response.message}');
          ErrorDialog.showError(context, '${response.message}');
        }
        // Login failed
        ErrorDialog.showError(context, '${response.message}');
      } else {
        // Handle other cases
        ErrorDialog.showError(
            context, "An unexpected error occurred: ${response.message}");
      }
    } catch (e) {
      // Handle unexpected errors
      ErrorDialog.showError(context, 'An unexpected error occurred.');
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false when API call finishes
    }
  }
}
