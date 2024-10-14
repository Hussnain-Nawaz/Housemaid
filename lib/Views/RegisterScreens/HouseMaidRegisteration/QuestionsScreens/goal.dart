import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/CustomWidgets/optionTile.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/servicesType.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  // Find the existing HousemaidRegistrationController
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();

  String selectedOption = "";

  void _handleOptionSelection(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void _showSelectionDialog() {
    ErrorDialog.showError(context, "Please select an option.");
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.015), // Responsive spacing
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.09, // Responsive size
                  height: screenWidth * 0.09, // Responsive size
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              Text(
                'Got it. What’s your biggest goal for being HouseMaid?',
                style: TextStyle(
                  fontSize: screenWidth * 0.08, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      OptionTile(
                        optionText: 'To earn my main income',
                        isSelected: selectedOption == 'To earn my main income',
                        onTap: () =>
                            _handleOptionSelection('To earn my main income'),
                      ),
                      OptionTile(
                        optionText: 'To make money on the side',
                        isSelected:
                            selectedOption == 'To make money on the side',
                        onTap: () =>
                            _handleOptionSelection('To make money on the side'),
                      ),
                      OptionTile(
                        optionText: 'To get experience, for a full-time job',
                        isSelected: selectedOption ==
                            'To get experience, for a full-time job',
                        onTap: () => _handleOptionSelection(
                            'To get experience, for a full-time job'),
                      ),
                      OptionTile(
                        optionText: 'I do not have a goal in mind yet',
                        isSelected: selectedOption ==
                            'I do not have a goal in mind yet',
                        onTap: () => _handleOptionSelection(
                            'I do not have a goal in mind yet'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              ElevatedButton(
                onPressed: () {
                  if (selectedOption.isEmpty) {
                    _showSelectionDialog();
                  } else {
                    // Store the selected option in answer3 of the controller
                    registrationController.answer3.value = selectedOption;

                    // Print all values of the controller
                    print(
                        'Profile Type: ${registrationController.profileType.value}');
                    print(
                        'Full Name: ${registrationController.fullName.value}');
                    print('Email: ${registrationController.email.value}');
                    print('Password: ${registrationController.password.value}');
                    print(
                        'Confirm Password: ${registrationController.confirmPassword.value}');
                    print('Answer 1: ${registrationController.answer1.value}');
                    print('Answer 2: ${registrationController.answer2.value}');
                    print('Answer 3: ${registrationController.answer3.value}');
                    print('Answer 4: ${registrationController.answer4.value}');
                    // print('Schedule: ${registrationController.schedule}');
                    print(
                        'Hourly Rate: ${registrationController.hourlyRate.value}');
                    print('Country: ${registrationController.country.value}');
                    print(
                        'Identity Type: ${registrationController.identityType.value}');
                    print(
                        'License Front Image: ${registrationController.licenseFrontImage.value}');
                    print(
                        'License Back Image: ${registrationController.licenseBackImage.value}');
                    print(
                        'Selfie With License Image: ${registrationController.selfieWithLicenseImage.value}');
                    print(
                        'Address Proof PDF: ${registrationController.addressProofPDF.value}');
                    print(
                        'Vaccination Proof PDF: ${registrationController.vaccinationProofPDF.value}');

                    // Proceed to the next screen
                    Get.to(() => ServicesScreen());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEB0D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                  minimumSize: Size(double.infinity,
                      screenHeight * 0.08), // Responsive button height
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05, // Responsive font size
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Responsive spacing
            ],
          ),
        ),
      ),
    );
  }
}
