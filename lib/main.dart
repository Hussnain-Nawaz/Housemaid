import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:house_maid_project/Bindings/appbindings.dart';
import 'package:house_maid_project/Views/DriverLicense/KYC_Steps.dart';
import 'package:house_maid_project/Views/HomeScreen/homeScreen.dart';
import 'package:house_maid_project/Views/OnboardingScreens/onboardingScreen.dart';
import 'package:house_maid_project/Views/RegisterScreens/chooseProfile.dart';
import 'package:house_maid_project/Views/login/loginScreen.dart';
import 'package:house_maid_project/Views/splash/splash.dart';

void main() async {
  // Lock the app orientation to portrait mode only
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation
        .portraitDown, // Optional: Allows upside-down portrait mode too
  ]);

  // Initialize GetStorage

  await GetStorage.init();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HouseMaide',
      initialBinding: AppBindings(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => SplashScreenView(),
        '/': (context) => SplashScreenView(),
        '/onboarding': (context) => OnboardingScreenOne(),
        '/register': (context) => ChooseProfileScreen(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
// ROutes working .......