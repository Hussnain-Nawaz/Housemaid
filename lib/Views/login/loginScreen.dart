import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:house_maid_project/Controllers/Registeration/GoogleSIgnIn.dart'; // Import GoogleSignInController
import 'package:house_maid_project/Controllers/login/loginController.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart'; // Custom button widget
import 'package:house_maid_project/CustomWidgets/TextField.dart';
import 'package:house_maid_project/Views/RegisterScreens/chooseProfile.dart';
import 'package:house_maid_project/Views/forgotPassword/forgotpassword.dart'; // Import LoginController

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GoogleSignInController googleSignInController =
      Get.put(GoogleSignInController()); // Initialize GoogleSignInController
  final LoginController loginController =
      Get.put(LoginController()); // Initialize LoginController

  // Variables to handle role selection
  bool isClientSelected = true; // Default selection is Client (role_id = 1)
  int roleId = 1; // Default role_id for Client

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordStrong(String password) {
    final strongPassword =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
    return strongPassword.hasMatch(password);
  }

  void _login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Check for empty fields
    if (email.isEmpty) {
      _showErrorDialog(context, "Please enter your email.");
      return;
    }

    // Validate email format
    if (!_isEmailValid(email)) {
      _showErrorDialog(context, "Please enter a valid email address.");
      return;
    }

    // Check for empty password
    if (password.isEmpty) {
      _showErrorDialog(context, "Please enter your password.");
      return;
    }

    // Check for password strength
    if (!_isPasswordStrong(password)) {
      _showErrorDialog(context,
          "Password must be at least 6 characters long and contain both letters and numbers.");
      return;
    }

    // Call login function in the LoginController
    loginController.login(email, password, roleId, context);
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.scale,
      title: 'Error',
      desc: errorMessage,
      btnOkOnPress: () {},
      btnOkColor: const Color(0xFFFEB0D9), // Your theme color
    ).show();
  }

  void _showExitDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      headerAnimationLoop: false,
      animType: AnimType.scale,
      title: 'Exit App',
      desc: 'Are you sure you want to exit the app?',
      btnCancelOnPress: () {}, // Dismisses the dialog
      btnOkOnPress: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop(); // Closes the app for Android
        } else if (Platform.isIOS) {
          exit(0); // Closes the app for iOS
        }
      },
      btnOkText: "Yes",
      btnCancelText: "No",
      btnOkColor: const Color(0xFFFEB0D9), // Matches your app's theme
      btnCancelColor: Colors.grey,
    ).show();
  }

  Future<bool> _onWillPop() async {
    _showExitDialog(context);
    return false; // Prevents the screen from popping automatically
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Obx(
          () => Stack(
            children: [
              SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.10),
                          const Text(
                            'Welcome back! Glad to see you, Again!',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'Urbanist',
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              height: 1.3,
                              letterSpacing: -0.32,
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            hintText: 'Enter your Email',
                            controller: emailController,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            hintText: 'Enter Your Password',
                            controller: passwordController,
                            obscureText: true,
                            isPassword: true,
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.to(() => ForgotPasswordScreen());
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color(0xFF8391A1),
                                  fontFamily: 'Urbanist',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),

                          // Role Selection
                          SwitchListTile(
                            title:
                                Text(isClientSelected ? "Client" : "Housemaid"),
                            value: isClientSelected,
                            onChanged: (bool value) {
                              setState(() {
                                isClientSelected = value;
                                roleId = value ? 1 : 2;
                              });
                            },
                            secondary: Icon(
                              isClientSelected
                                  ? Icons.person
                                  : Icons.cleaning_services,
                            ),
                          ),

                          const SizedBox(height: 30),
                          CustomNextButton(
                            text: 'Login',
                            onPressed: _login,
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              Expanded(
                                  child: Divider(color: Color(0xFFDEDEDE))),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'Or Login with',
                                  style: TextStyle(
                                    color: Color(0xFF8391A1),
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Divider(color: Color(0xFFDEDEDE))),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    googleSignInController.initiateGoogleSignIn(
                                        context, roleId);
                                  },
                                  child: Container(
                                    height: 62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(31),
                                      border: Border.all(
                                          color: const Color(0xFFDEDEDE)),
                                      color: const Color(0xFFFAFAFA),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/google.png',
                                            width: 25.887, height: 26.169),
                                        const SizedBox(width: 10),
                                        const Text(
                                          'Google',
                                          style: TextStyle(
                                            fontFamily: 'Urbanist',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  height: 62,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(31),
                                    border: Border.all(
                                        color: const Color(0xFFDEDEDE)),
                                    color: const Color(0xFFFAFAFA),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/images/facebook.png',
                                          width: 28, height: 28),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'Facebook',
                                        style: TextStyle(
                                          fontFamily: 'Urbanist',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.10),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don’t have an account? ",
                                style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: 'Urbanist',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.16,
                                  height: 1.4,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Register Now",
                                    style: const TextStyle(
                                      color: Color(0xFFFEB0D9),
                                      fontFamily: 'Urbanist',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.16,
                                      height: 1.4,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(() => ChooseProfileScreen());
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Show loader when login is in progress
              if (loginController.isLoading.value ||
                  googleSignInController.isLoading.value)
                // if (loginController.isLoading.value)
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink, // Customize loader color here
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
