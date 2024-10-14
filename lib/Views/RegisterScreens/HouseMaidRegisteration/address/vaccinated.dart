import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/CustomWidgets/optionTile.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/address/vaccinatedproof.dart'; // Adjust the import to the correct path

class VaccinatedScreen extends StatefulWidget {
  const VaccinatedScreen({super.key});

  @override
  _VaccinatedScreenState createState() => _VaccinatedScreenState();
}

class _VaccinatedScreenState extends State<VaccinatedScreen> {
  String selectedOption = "";

  void _handleOptionSelection(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
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
                  height: screenHeight * 0.05, // Responsive size
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // Responsive spacing
              Text(
                'Are you Vaccinated Completely?',
                style: TextStyle(
                  fontSize: screenWidth * 0.08, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.06), // Responsive spacing
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      OptionTile(
                        optionText: 'Yes',
                        isSelected: selectedOption == 'Option 1',
                        onTap: () => _handleOptionSelection('Option 1'),
                      ),
                      OptionTile(
                        optionText: 'No',
                        isSelected: selectedOption == 'Option 2',
                        onTap: () => _handleOptionSelection('Option 2'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              ElevatedButton(
                onPressed: () {
                  if (selectedOption == 'Option 1') {
                    Get.to(() => VaccinationProofScreen());
                  } else if (selectedOption == 'Option 2') {
                    ErrorDialog.showError(
                        context, "You must be vaccinated first");
                  } else {
                    ErrorDialog.showError(context, "Select an Option");
                  }
                },
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
              SizedBox(
                  height: screenHeight *
                      0.04), // Responsive spacing after the button
            ],
          ),
        ),
      ),
    );
  }
}
