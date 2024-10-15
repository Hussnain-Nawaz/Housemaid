import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/Views/OnboardingScreens/onboarding%20screen3.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button Positioned in the Top-Left Corner
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05, // 5% height padding
                  left: screenWidth * 0.05, // 5% width padding
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/backbutton.png',
                    width: screenWidth * 0.1, // 10% of screen width
                    height: screenWidth * 0.1, // Keep square dimensions
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.07), // 7% height spacing

              // Responsive Image Container
              Center(
                child: Container(
                  width: screenWidth * 0.45, // 60% of screen width
                  height: screenHeight * 0.3, // 30% of screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.08),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/onboard2.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% height spacing

              // Responsive Title Text
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: const Text(
                    'House Keeping',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: 'Urbanist',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      height: 1.3, // 130% line height
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% height spacing

              // Responsive Description Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                  'sed do eiusmod tempor incididunt ut labore et dolore.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8391A1),
                    fontFamily: 'Urbanist',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1.25, // 125% line height
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.12), // 5% height spacing

              // Pagination Dots Container
              Center(
                child: Container(
                  width: screenWidth * 0.15, // 15% of screen width
                  height: screenHeight * 0.02, // 2% of screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth * 0.08),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/2nd_dot.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 10% height spacing

              // Custom Next Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: CustomNextButton(
                  text: 'Next',
                  onPressed: () {
                    Get.to(() => OnboardingScreenThree());
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.04), // 4% height spacing
            ],
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
// import 'package:house_maid_project/Views/OnboardingScreens/onboarding%20screen3.dart';

// class OnboardingScreenTwo extends StatelessWidget {
//   const OnboardingScreenTwo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Screen width and height for responsiveness
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Responsive Image Container
//                   Container(
//                     width: screenWidth * 0.6, // 60% of screen width
//                     height: screenHeight * 0.3, // 30% of screen height
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                       image: const DecorationImage(
//                         image: AssetImage('assets/images/onboard2.png'),
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02), // 2% height spacing

//                   // Title Text Container
//                   Container(
//                     width: screenWidth * 0.9, // 90% of screen width
//                     padding: EdgeInsets.all(screenWidth * 0.02), // 2% padding
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                     ),
//                     child: const Text(
//                       'House Keeping',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF000000),
//                         fontFamily: 'Urbanist',
//                         fontSize: 32,
//                         fontWeight: FontWeight.w600,
//                         height: 1.3, // Line height of 130%
//                         letterSpacing: -0.32,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02), // 2% height spacing

//                   // Description Text Container
//                   Container(
//                     width: screenWidth * 0.9, // 90% of screen width
//                     padding: EdgeInsets.all(screenWidth * 0.02),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                     ),
//                     child: const Text(
//                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF8391A1),
//                         fontFamily: 'Urbanist',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                         height: 1.25, // Line height of 125%
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.05), // 5% height spacing

//                   // Pagination Dots Container
//                   Container(
//                     width: screenWidth * 0.15, // 15% of screen width
//                     height: screenHeight * 0.02, // 2% of screen height
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(screenWidth * 0.08),
//                       image: const DecorationImage(
//                         image: AssetImage('assets/images/2nd_dot.png'),
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.1), // 10% height spacing

//                   // Custom Next Button with Responsive Padding
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//                     child: CustomNextButton(
//                       text: 'Next',
//                       onPressed: () {
//                         Get.to(() => OnboardingScreenThree());
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Back Button Image in the Top-left Corner
//             Positioned(
//               top: screenHeight * 0.08, // 8% of screen height
//               left: screenWidth * 0.05, // 5% of screen width
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Image.asset(
//                   'assets/images/backbutton.png',
//                   width: screenWidth * 0.1, // 10% of screen width
//                   height: screenWidth * 0.1, // Keep square dimensions
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
