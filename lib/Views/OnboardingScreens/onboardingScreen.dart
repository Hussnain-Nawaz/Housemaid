import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/Views/OnboardingScreens/onboarding%20screen2.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          // Added SingleChildScrollView to make the content scrollable
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.12),

                // Responsive Image Container
                Container(
                  width: screenWidth * 0.45, // 45% of screen width
                  height: screenHeight * 0.3, // 30% of screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.08),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/onboarding_image.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02), // 2% of screen height

                // Responsive Welcome Text
                Container(
                  width: screenWidth * 0.9, // 90% of screen width
                  padding: EdgeInsets.all(screenWidth * 0.02), // 2% padding
                  child: const Text(
                    'House Cleaning',
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

                SizedBox(height: screenHeight * 0.02), // 2% of screen height

                // Responsive Description Text
                Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8391A1),
                      fontFamily: 'Urbanist',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.25,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.12), // 12% of screen height

                // Pagination Dots Container
                Container(
                  width: screenWidth * 0.15, // 15% of screen width
                  height: screenHeight * 0.015, // 1.5% of screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.08),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/pagination_dots.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02), // 2% of screen height

                // Custom Next Button with Responsive Padding
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: CustomNextButton(
                    text: 'Next',
                    onPressed: () {
                      Get.to(() => OnboardingScreenTwo());
                    },
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
// import 'package:house_maid_project/Views/OnboardingScreens/onboarding%20screen2.dart';

// class OnboardingScreenOne extends StatelessWidget {
//   const OnboardingScreenOne({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Get screen width and height for responsiveness
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: screenHeight * 0.12),
//               // Responsive Image Container
//               Container(
//                 width: screenWidth * 0.45, // 60% of screen width
//                 height: screenHeight * 0.3, // 30% of screen height
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/onboarding_image.png'),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02), // 2% of screen height

//               // Responsive Welcome Text
//               Container(
//                 width: screenWidth * 0.9, // 90% of screen width
//                 padding: EdgeInsets.all(screenWidth * 0.02), // 2% padding
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                 ),
//                 child: const Text(
//                   'House Cleaning',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFF000000),
//                     fontFamily: 'Urbanist',
//                     fontSize: 32,
//                     fontWeight: FontWeight.w600,
//                     height: 1.3, // Line height of 130%
//                     letterSpacing: -0.32,
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02), // 2% of screen height

//               // Responsive Description Text
//               Container(
//                 width: screenWidth * 0.9,
//                 padding: EdgeInsets.all(screenWidth * 0.02),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                 ),
//                 child: const Text(
//                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFF8391A1),
//                     fontFamily: 'Urbanist',
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     height: 1.25,
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.12), // 12% of screen height

//               // Pagination Dots Container
//               Container(
//                 width: screenWidth * 0.15, // 15% of screen width
//                 height: screenHeight * 0.015, // 1.5% of screen height
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/pagination_dots.png'),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02), // 2% of screen height

//               // Custom Next Button with Responsive Padding
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//                 child: CustomNextButton(
//                   text: 'Next',
//                   onPressed: () {
//                     Get.to(() => OnboardingScreenTwo());
//                   },
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
