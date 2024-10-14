import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/Controllers/Registeration/Client/ClientRegController.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/ClientRegisteration/Clientregisterscreen.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/registerScreen.dart';

class ChooseProfileScreen extends StatefulWidget {
  const ChooseProfileScreen({super.key});

  @override
  _ChooseProfileScreenState createState() => _ChooseProfileScreenState();
}

class _ChooseProfileScreenState extends State<ChooseProfileScreen> {
  // Controllers for housemaid and client
  final HousemaidRegistrationController housemaidController =
      Get.put(HousemaidRegistrationController());
  final ClientRegistrationController clientController =
      Get.put(ClientRegistrationController());

  String selectedProfile = '';

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
              // Back Button
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: screenWidth * 0.08, // Responsive size for back button
                  height: screenWidth * 0.08, // Responsive size for back button
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Title
              Text(
                'Choose your Profile',
                style: TextStyle(
                  fontSize: screenWidth * 0.065, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              // Profile Options
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedProfile = 'Client Hiring';
                  });
                },
                child: ProfileOption(
                  profileType: "I'm Client Hiring for Job.",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
                  imagePath: 'assets/images/client_icon.png',
                  isSelected: selectedProfile == 'Client Hiring',
                  screenWidth:
                      screenWidth, // Passing screen width for responsive design
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedProfile = 'House Maid';
                  });
                },
                child: ProfileOption(
                  profileType: "I'm House Maid, Looking for work.",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  imagePath: 'assets/images/maid_icon.png',
                  isSelected: selectedProfile == 'House Maid',
                  screenWidth:
                      screenWidth, // Passing screen width for responsive design
                ),
              ),
              const Spacer(),
              // Next Button
              ElevatedButton(
                onPressed: () {
                  if (selectedProfile.isNotEmpty) {
                    if (selectedProfile == 'House Maid') {
                      // Store profile type in housemaid controller
                      housemaidController.profileType.value = 2;
                      // Navigate to housemaid registration screen
                      Get.to(() => RegistrationScreen());
                    } else if (selectedProfile == 'Client Hiring') {
                      // Store profile type in client controller
                      clientController.profileType.value = 1;
                      // Navigate to client registration screen
                      Get.to(() => CLientRegisterationSCreen());
                    }
                  } else {
                    ErrorDialog.showError(
                        context, "Please select a profile option.");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEB0D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        screenWidth * 0.08), // Responsive button radius
                  ),
                  minimumSize: Size(double.infinity,
                      screenHeight * 0.07), // Responsive button size
                ),
                child: Text(
                  selectedProfile == 'Client Hiring'
                      ? 'Continue as a client'
                      : selectedProfile == 'House Maid'
                          ? 'Continue as house Maid'
                          : 'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth *
                        0.045, // Responsive font size for button text
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05, // Responsive bottom space
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String profileType;
  final String description;
  final String imagePath;
  final bool isSelected;
  final double screenWidth; // For responsive design

  const ProfileOption({
    super.key,
    required this.profileType,
    required this.description,
    required this.imagePath,
    required this.isSelected,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? const Color(0xFFFEB0D9) : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
            screenWidth * 0.03), // Responsive border radius
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                width: screenWidth * 0.15, // Responsive image size
                height: screenWidth * 0.15, // Responsive image size
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenWidth * 0.04), // Responsive spacing
              Text(
                profileType,
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: screenWidth * 0.02), // Responsive spacing
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Responsive font size
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Positioned(
            top: screenWidth * 0.02, // Responsive positioning
            right: screenWidth * 0.02, // Responsive positioning
            child: Container(
              width: screenWidth *
                  0.06, // Responsive size for the indicator circle
              height: screenWidth *
                  0.06, // Responsive size for the indicator circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFFEB0D9) : Colors.grey,
                  width: 2,
                ),
                color: isSelected ? const Color(0xFFFEB0D9) : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
