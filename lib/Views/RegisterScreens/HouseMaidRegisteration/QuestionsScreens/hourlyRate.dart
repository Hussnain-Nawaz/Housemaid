import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart'; // Import the controller
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/QuestionsScreens/selectCountry.dart';

class HourlyRateScreen extends StatefulWidget {
  const HourlyRateScreen({super.key});

  @override
  _HourlyRateScreenState createState() => _HourlyRateScreenState();
}

class _HourlyRateScreenState extends State<HourlyRateScreen> {
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();

  String selectedCurrency = '\$';
  // Default currency set to pounds
  final TextEditingController rateController = TextEditingController();

  final List<String> currencies = ['\$']; // Only allow pound currency

  void _navigateToNextScreen() {
    String hourlyRateStr = rateController.text;
    if (hourlyRateStr.isEmpty || double.tryParse(hourlyRateStr) == 0.0) {
      // Show error if no rate is entered or if it is zero
      ErrorDialog.showError(
          context, "Please enter a valid hourly rate greater than zero.");
    } else {
      // Store the hourly rate in the controller
      registrationController.hourlyRate.value =
          double.parse(hourlyRateStr).toInt();

      // Print all values of the controller
      print('Profile Type: ${registrationController.profileType.value}');
      print('Full Name: ${registrationController.fullName.value}');
      print('Email: ${registrationController.email.value}');
      print('Password: ${registrationController.password.value}');
      print(
          'Confirm Password: ${registrationController.confirmPassword.value}');
      print('Answer 1: ${registrationController.answer1.value}');
      print('Answer 2: ${registrationController.answer2.value}');
      print('Answer 3: ${registrationController.answer3.value}');
      print('Answer 4: ${registrationController.answer4.value}');
      // print(registrationController.schedule);
      // for (var i = 0; i < registrationController.schedule.length; i++) {
      //   var day = _getDayName(i);
      //   var startTime = registrationController.schedule[i]['startTime'];
      //   var endTime = registrationController.schedule[i]['endTime'];
      // }
      print('Hourly Rate: £${registrationController.hourlyRate.value}');
      print('Country: ${registrationController.country.value}');
      print('Identity Type: ${registrationController.identityType.value}');
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

      // Navigate to the next screen
      Get.to(() => Selectcountry());
    }
  }

  String _getDayName(int index) {
    switch (index) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.09, // Responsive size
                  height: screenWidth * 0.09,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Text(
                'Enter your Hourly Service Rate.',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: screenWidth * 0.08, // Responsive font size
                  fontWeight: FontWeight.w700,
                  height: 1.3, // Line height: 130%
                  letterSpacing: -0.32,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: screenHeight * 0.07),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Stack(
                children: [
                  // The TextField for the hourly rate
                  TextField(
                    controller: rateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '0/h',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(31.5),
                        borderSide: const BorderSide(color: Color(0xFFFEB0D9)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(31.5),
                        borderSide: const BorderSide(color: Color(0xFFFEB0D9)),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: screenWidth * 0.04,
                        right: screenWidth *
                            0.16, // Increased padding for dropdown
                      ),
                    ),
                  ),
                  // The DropdownButton for currency selection
                  Positioned(
                    right: screenWidth * 0.04, // Adjusted for responsiveness
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: DropdownButton<String>(
                        value: selectedCurrency,
                        underline: Container(), // Remove underline
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCurrency = newValue!;
                          });
                        },
                        items: currencies
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEB0D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31.5),
                  ),
                  minimumSize: Size(double.infinity,
                      screenHeight * 0.07), // Responsive button
                ),
                onPressed: _navigateToNextScreen,
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: screenWidth * 0.05, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
          ],
        ),
      ),
    );
  }
}
