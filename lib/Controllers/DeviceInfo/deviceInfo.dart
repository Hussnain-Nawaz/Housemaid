import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceInfoService {
  // Method to get the device ID
  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo
            .id; // Use 'id' for Android device ID in the latest version
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // iOS device ID
      }
    } catch (e) {
      print("Error getting device ID: $e");
      return null; // Return null in case of error
    }
    return null; // Return null if not Android or iOS
  }
}
