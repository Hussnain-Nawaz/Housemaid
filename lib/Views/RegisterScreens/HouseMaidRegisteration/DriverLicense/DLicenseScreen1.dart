import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/DriverLicense/capturescreen.dart';

class ValidateLicenseScreen extends StatelessWidget {
  const ValidateLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get device screen height and width for responsiveness
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              // Custom Back Button
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, top: height * 0.02),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/backbutton.png',
                    width: width * 0.1,
                    height: width * 0.1,
                  ),
                ),
              ),
              // Heading
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: Text(
                  'Validating your driver’s license.',
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontFamily: 'Urbanist',
                    fontSize: height * 0.04,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Subheading
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  'Please upload your driver’s license.',
                  style: TextStyle(
                    color: const Color(0xFF8391A1),
                    fontFamily: 'Poppins',
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Image
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/start_check_image.png', // Update with the correct image path
                    width: width * 0.6, // Adjust the size responsively
                    height: width * 0.6,
                  ),
                ),
              ),
              // Start Check Button
              Padding(
                padding: EdgeInsets.all(width * 0.04),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFFEB0D9), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(31), // Button border radius
                    ),
                    minimumSize:
                        Size(double.infinity, height * 0.08), // Button size
                  ),
                  onPressed: () {
                    // Add your logic for start check here
                    print('Start Check Pressed');
                    Get.to(() => ValidateDriverLicenseScreen());
                  },
                  child: Text(
                    'Start Check',
                    style: TextStyle(
                      fontSize: height * 0.025,
                      color: Colors.white,
                      height: 1.4, // 140% line height
                      letterSpacing: 0.16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
