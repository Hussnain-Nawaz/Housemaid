import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/Client/ClientRegController.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/CustomWidgets/TextField.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/login/loginScreen.dart';

class CLientRegisterationSCreen extends StatefulWidget {
  const CLientRegisterationSCreen({super.key});

  @override
  _CLientRegisterationSCreenState createState() =>
      _CLientRegisterationSCreenState();
}

class _CLientRegisterationSCreenState extends State<CLientRegisterationSCreen> {
  final ClientRegistrationController _registrationController =
      Get.find<ClientRegistrationController>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _resetFields();
  }

  void _resetFields() {
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void _register() {
    _registrationController.fullName.value = fullNameController.text;
    _registrationController.email.value = emailController.text;
    _registrationController.password.value = passwordController.text;
    _registrationController.confirmPassword.value =
        confirmPasswordController.text;

    _registrationController.register(context);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => Stack(
            children: [
              WillPopScope(
                onWillPop: () async {
                  _resetFields();
                  return true;
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        GestureDetector(
                          onTap: () {
                            _resetFields();
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/backbutton.png',
                            width: screenWidth * 0.09,
                            height: screenWidth * 0.09,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Hello! Register to get started',
                          style: TextStyle(
                            color: const Color(0xFF000000),
                            fontFamily: 'Urbanist',
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            letterSpacing: -0.32,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        CustomTextField(
                          hintText: 'Full Name',
                          controller: fullNameController,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        CustomTextField(
                          hintText: 'Email',
                          controller: emailController,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        CustomTextField(
                          hintText: 'Password',
                          controller: passwordController,
                          obscureText: true,
                          isPassword: true,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        CustomTextField(
                          hintText: 'Confirm Password',
                          controller: confirmPasswordController,
                          obscureText: true,
                          isPassword: true,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                              activeColor: const Color(0xFFFEB0D9),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'I agree to the ',
                                  style: TextStyle(
                                    color: const Color(0xFF000000),
                                    fontFamily: 'Urbanist',
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Terms and Services',
                                      style: const TextStyle(
                                        color: Color(0xFFFEB0D9),
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle Terms and Services tap
                                        },
                                    ),
                                    const TextSpan(
                                      text: ' and ',
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy.',
                                      style: const TextStyle(
                                        color: Color(0xFFFEB0D9),
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Handle Privacy Policy tap
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomNextButton(
                          text: 'Register',
                          onPressed: _register,
                        ),
                        // Add remaining parts of your UI here...
                      ],
                    ),
                  ),
                ),
              ),
              if (_registrationController.isLoading.value)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
