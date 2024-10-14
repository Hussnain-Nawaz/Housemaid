import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'dart:io';

import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/DriverLicense/KYC_Steps.dart';

class VaccinationProofScreen extends StatefulWidget {
  const VaccinationProofScreen({super.key});

  @override
  _VaccinationProofScreenState createState() => _VaccinationProofScreenState();
}

class _VaccinationProofScreenState extends State<VaccinationProofScreen> {
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();

  FilePickerResult? _pickedFile;
  bool _isFileUploaded = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Only allow PDF files
    );

    if (result != null) {
      setState(() {
        _pickedFile = result;
        _isFileUploaded = true;
      });
    } else {
      // User canceled the picker
    }
  }

  void _uploadAndNavigateBack() {
    if (_pickedFile != null && _pickedFile!.files.single.extension == 'pdf') {
      // Store the PDF file in the controller
      registrationController.vaccinationProofPDF.value =
          File(_pickedFile!.files.single.path!);

      // Print all values in the controller
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
      print(
          'Address Proof PDF: ${registrationController.addressProofPDF.value}');
      print(
          'Vaccination Proof PDF: ${registrationController.vaccinationProofPDF.value}');

      // Go back to the KYC screen
      Get.to(() => KYCScreen());
    } else {
      ErrorDialog.showError(context, "Please upload your vaccination proof");
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
    // Get the screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.09, // Responsive size
                  height: screenHeight * 0.05, // Responsive size
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Vaccination Proof',
                style: TextStyle(
                  fontSize: screenWidth * 0.08, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Kindly attach your vaccination document.',
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsive font size
                  color: const Color(0xFF8391A1),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  width: screenWidth * 0.95, // Responsive width
                  height: screenHeight * 0.25, // Responsive height
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFFEB0D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFFFEB0D9).withOpacity(0.2),
                  ),
                  child: _isFileUploaded
                      ? Center(
                          child: Image.asset(
                            'assets/images/tick.png',
                            width: screenWidth * 0.13,
                            height: screenHeight * 0.07,
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.add,
                            size: screenWidth * 0.13, // Responsive size
                            color: const Color(0xFFFEB0D9),
                          ),
                        ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Center(
                child: Text(
                  'Share as a PDF',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Responsive font size
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _uploadAndNavigateBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEB0D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                  minimumSize: Size(double.infinity,
                      screenHeight * 0.08), // Responsive button size
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05, // Responsive font size
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
