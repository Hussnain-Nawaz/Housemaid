
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VaccinationRecordsScreen extends StatefulWidget {
  const VaccinationRecordsScreen({super.key});

  @override
  _VaccinationRecordsScreenState createState() =>
      _VaccinationRecordsScreenState();
}

class _VaccinationRecordsScreenState extends State<VaccinationRecordsScreen> {
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();
  final ImagePicker _picker = ImagePicker();
  File? _vaccinationProof;

  Future<void> _pickVaccinationProof() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _vaccinationProof = File(pickedFile.path);
      });
      registrationController.vaccinationProofPDF.value = _vaccinationProof;
    }
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccination Records'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Upload Button
              ElevatedButton(
                onPressed: _pickVaccinationProof,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                  ),
                ),
                child: Text(
                  'Upload Vaccination Proof',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Display the uploaded image if available
              if (_vaccinationProof != null)
                Image.file(
                  _vaccinationProof!,
                  width: screenWidth * 0.4, // Responsive image size
                  height: screenHeight * 0.2,
                ),
              SizedBox(height: screenHeight * 0.05),
              // Done Button
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                  ),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
