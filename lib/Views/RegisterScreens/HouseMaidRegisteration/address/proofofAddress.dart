
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'dart:io';

import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';

class ProofOfAddressScreen extends StatefulWidget {
  const ProofOfAddressScreen({super.key});

  @override
  _ProofOfAddressScreenState createState() => _ProofOfAddressScreenState();
}

class _ProofOfAddressScreenState extends State<ProofOfAddressScreen> {
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
    }
  }

  void _uploadAndNavigateBack() {
    if (_pickedFile != null && _pickedFile!.files.single.extension == 'pdf') {
      registrationController.addressProofPDF.value =
          File(_pickedFile!.files.single.path!);

      // Go back to the KYC screen
      Navigator.pop(context);
    } else {
      ErrorDialog.showError(context, "Please upload your address proof.");
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
    // Get screen height and width
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.09, // Responsive width
                  height: screenHeight * 0.05, // Responsive height
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Text(
                'Proof of Address',
                style: TextStyle(
                  fontSize: screenWidth * 0.08, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Text(
                'Kindly attach your electricity bill, internet bill, or any kind of proof by which we can verify.',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  color: const Color(0xFF8391A1),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  width: screenWidth * 0.9, // Responsive width
                  height: screenHeight * 0.3, // Responsive height
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
                            'assets/images/tick.png', // Your tick image
                            width: screenWidth * 0.13,
                            height: screenHeight * 0.1,
                          ),
                        )
                      : Center(
                          child: Icon(Icons.add,
                              size: screenWidth * 0.12,
                              color: const Color(0xFFFEB0D9)),
                        ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Center(
                child: Text(
                  'Share as a PDF',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // Responsive font size
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
                  minimumSize: Size(double.infinity, screenHeight * 0.08),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
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
