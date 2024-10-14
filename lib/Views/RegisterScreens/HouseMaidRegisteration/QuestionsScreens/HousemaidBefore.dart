import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart'; // Import the controller
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/CustomWidgets/optionTile.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/QuestionsScreens/experience.dart';

class HouseMaidBefore extends StatefulWidget {
  const HouseMaidBefore({super.key});

  @override
  _HouseMaidBeforeState createState() => _HouseMaidBeforeState();
}

class _HouseMaidBeforeState extends State<HouseMaidBefore> {
  final HousemaidRegistrationController registrationController =
      Get.put(HousemaidRegistrationController()); // Initialize the controller
  String selectedOption = "";

  void _handleOptionSelection(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  void _showSelectionDialog() {
    ErrorDialog.showError(context, "Please select an option.");
    return;
  }

  void _goToNextScreen() {
    if (selectedOption.isEmpty) {
      _showSelectionDialog();
      return;
    }

    // Store the selected answer in the controller
    registrationController.answer1.value = selectedOption;
    // Print all values of the controller
    print('Profile Type: ${registrationController.profileType.value}');
    print('Full Name: ${registrationController.fullName.value}');
    print('Email: ${registrationController.email.value}');
    print('Password: ${registrationController.password.value}');
    print('Confirm Password: ${registrationController.confirmPassword.value}');
    print('Answer 1: ${registrationController.answer1.value}');
    print('Answer 2: ${registrationController.answer2.value}');
    print('Answer 3: ${registrationController.answer3.value}');
    print('Answer 4: ${registrationController.answer4.value}');
    // print('Schedule: ${registrationController.schedule}');
    print('Hourly Rate: ${registrationController.hourlyRate.value}');
    print('Country: ${registrationController.country.value}');
    print('Identity Type: ${registrationController.identityType.value}');
    print(
        'License Front Image: ${registrationController.licenseFrontImage.value}');
    print(
        'License Back Image: ${registrationController.licenseBackImage.value}');
    print(
        'Selfie With License Image: ${registrationController.selfieWithLicenseImage.value}');
    print('Address Proof PDF: ${registrationController.addressProofPDF.value}');
    print(
        'Vaccination Proof PDF: ${registrationController.vaccinationProofPDF.value}');

    // Navigate to the next screen
    Get.to(() => ExperienceScreen());
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
                'A few quick questions: first, have you HouseMaid before?',
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
                        optionText: 'I’m new to this',
                        isSelected: selectedOption == 'I’m new to this',
                        onTap: () => _handleOptionSelection('I’m new to this'),
                      ),
                      OptionTile(
                        optionText: 'I have some experience',
                        isSelected: selectedOption == 'I have some experience',
                        onTap: () =>
                            _handleOptionSelection('I have some experience'),
                      ),
                      OptionTile(
                        optionText: 'I am an expert',
                        isSelected: selectedOption == 'I am an expert',
                        onTap: () => _handleOptionSelection('I am an expert'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              ElevatedButton(
                onPressed: _goToNextScreen, // Handle the Next button press
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
