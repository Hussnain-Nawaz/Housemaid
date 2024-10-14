import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the controller
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/DriverLicense/KYC_Steps.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ValidateDriverLicenseScreen extends StatefulWidget {
  const ValidateDriverLicenseScreen({super.key});

  @override
  _ValidateDriverLicenseScreenState createState() =>
      _ValidateDriverLicenseScreenState();
}

class _ValidateDriverLicenseScreenState
    extends State<ValidateDriverLicenseScreen> {
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();
  final ImagePicker _picker = ImagePicker();
  File? _frontImage;
  File? _backImage;
  File? _selfieImage;

  Future<void> _pickImage(String mode) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      setState(() {
        if (mode == 'front') {
          _frontImage = File(pickedFile.path);
        } else if (mode == 'back') {
          _backImage = File(pickedFile.path);
        } else if (mode == 'selfie') {
          _selfieImage = File(pickedFile.path);
        }
      });
    }
  }

  void _submit() {
    if (_frontImage == null || _backImage == null || _selfieImage == null) {
      ErrorDialog.showError(context, "Please capture all images");
    } else {
      // Store the images in the controller
      registrationController.licenseFrontImage.value = _frontImage;
      registrationController.licenseBackImage.value = _backImage;
      registrationController.selfieWithLicenseImage.value = _selfieImage;

      // Print image paths
      print('Front Image Path: ${_frontImage!.path}');
      print('Back Image Path: ${_backImage!.path}');
      print('Selfie Image Path: ${_selfieImage!.path}');

      // Navigate to the next screen
      Get.to(() => KYCScreen());
    }
  }

  // void _showErrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Error'),
  //       content: Text(message),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: 36,
                  height: 36,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Validating your driver\'s license.',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1,
                children: [
                  _buildCameraButton(
                      'Driver\'s license: front', 'front', _frontImage != null),
                  _buildCameraButton(
                      'Driver\'s license: back', 'back', _backImage != null),
                  _buildCameraButton('Selfie with driver\'s license', 'selfie',
                      _selfieImage != null),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submit, // Call the submit method
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEB0D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31),
                  ),
                  minimumSize: const Size(double.infinity, 62),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCameraButton(String label, String mode, bool isCaptured) {
    return GestureDetector(
      onTap: () => _pickImage(mode),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.grey[200],
            child: Center(
              child: isCaptured
                  ? Image.asset(
                      'assets/images/tick.png', // Replace with your custom tick image asset path
                      width: 50,
                      height: 50,
                    )
                  : const Icon(Icons.add, size: 50),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
