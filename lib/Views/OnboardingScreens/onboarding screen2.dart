import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/Views/OnboardingScreens/onboarding%20screen3.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image with Border Radius
                  Container(
                    width: 223,
                    height: 252.66,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(31), // Rounded corners
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/dashboard3.png'), // Replace with your image asset path for screen 2
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Add some spacing
                  // Title Text with Border Radius
                  Container(
                    width: 367,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(31), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(8), // Optional padding
                    child: const Text(
                      'House Keeping',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Urbanist',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        height: 1.3, // Line height of 130%
                        letterSpacing: -0.32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Add some spacing
                  // Description Text with Border Radius
                  Container(
                    width: 367,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(31), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(8), // Optional padding
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF8391A1), // var(--Gray, #8391A1)
                        fontFamily: 'Urbanist',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1.25, // Line height of 125%
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Add some spacing
                  // Pagination Dots with Border Radius
                  Container(
                    width: 52,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(31), // Rounded corners
                      image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/2nd_dot.png'), // Replace with your dots asset path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 75), // Add some spacing
                  // Custom Next Button with Margins
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // Add horizontal margins
                    child: CustomNextButton(
                      text: 'Next',
                      onPressed: () {
                        Get.to(() => OnboardingScreenThree());
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Back Button Image in the top-left corner
            Positioned(
              top: 80, // Adjust this value to position the button correctly
              left: 20, // Adjust this value to position the button correctly
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: Image.asset(
                  'assets/images/backbutton.png', // Replace with your back button image asset path
                  width: 36, // Set width to 36px
                  height: 36, // Set height to 36px
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
