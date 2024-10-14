import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/DriverLicense/DLicenseScreen1.dart';

class Selectcountry extends StatefulWidget {
  const Selectcountry({super.key});

  @override
  _SelectcountryState createState() => _SelectcountryState();
}

class _SelectcountryState extends State<Selectcountry> {
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();

  String selectedCountry = 'United Kingdom'; // Default country
  String selectedIdentityType = 'Driver\'s License'; // Default identity type

  void _continueToNextScreen() {
    // Store the country and identity type in the controller
    registrationController.country.value = selectedCountry;
    registrationController.identityType.value = selectedIdentityType;

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
    // for (var i = 0; i < registrationController.schedule.length; i++) {
    //   var day = _getDayName(i);
    //   var startTime = registrationController.schedule[i]['startTime'];
    //   var endTime = registrationController.schedule[i]['endTime'];
    //   print(
    //       '$day: Start Time - ${startTime?.format(context)}, End Time - ${endTime?.format(context)}');
    // }
    // print(registrationController.schedule);
    print('Hourly Rate: £${registrationController.hourlyRate.value}');
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
    Get.to(() => ValidateLicenseScreen());
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            // Custom Back Button
            Padding(
              padding: EdgeInsets.only(left: width * 0.04),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: width * 0.1,
                  height: width * 0.1,
                ),
              ),
            ),
            // Heading
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Text(
                'Personal Details',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: height * 0.05,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            // Country Selection
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Container(
                width: width * 0.9,
                height: height * 0.08,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31.5),
                  border: Border.all(
                      color: const Color(0xFFDEDEDE)), // Border color
                  color: const Color(0xFFFAFAFA), // Background color
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCountry,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    alignment: Alignment.centerLeft,
                    onChanged: null, // Lock the field
                    items: [
                      DropdownMenuItem<String>(
                        value: 'United Kingdom',
                        child: Text(
                          'United Kingdom',
                          style: TextStyle(
                            color: Colors.black, // Ensuring the text is visible
                            fontSize: height * 0.02,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ID Type (Locked Dropdown)
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Container(
                width: width * 0.9,
                height: height * 0.08,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31.5),
                  border: Border.all(
                      color: const Color(0xFFDEDEDE)), // Border color
                  color: const Color(0xFFFAFAFA), // Background color
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedIdentityType,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    alignment: Alignment.centerLeft,
                    onChanged: null, // Lock the field
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Driver\'s License',
                        child: Text(
                          'Driver\'s License',
                          style: TextStyle(
                            color: Colors.black, // Ensuring the text is visible
                            fontSize: height * 0.02,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Continue Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEB0D9), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(31.5), // Button border radius
                  ),
                  minimumSize:
                      Size(double.infinity, height * 0.08), // Button size
                ),
                onPressed: _continueToNextScreen,
                child: Text(
                  'Continue',
                  style:
                      TextStyle(fontSize: height * 0.025, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }
}
