import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/Views/OnboardingScreens/onboarding%20screen2.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image with Border Radius
              Container(
                width: 223,
                height: 252.66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31), // Rounded corners
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/onboarding_image.png'), // Replace with your image asset path
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Add some spacing
              // Welcome Text with Border Radius
              Container(
                width: 367,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31), // Rounded corners
                ),
                padding: const EdgeInsets.all(8), // Optional padding
                child: const Text(
                  'Welcome back! Glad to see you, Again!',
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
                  borderRadius: BorderRadius.circular(31), // Rounded corners
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
                  borderRadius: BorderRadius.circular(31), // Rounded corners
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/pagination_dots.png'), // Replace with your dots asset path
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 50), // Add some spacing
              // Custom Next Button with Margins
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0), // Add horizontal margins
                child: CustomNextButton(
                  text: 'Next',
                  onPressed: () {
                    Get.to(() => OnboardingScreenTwo());
                    // Handle Next button press
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
