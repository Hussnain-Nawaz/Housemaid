import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/Registeration/housemaid/HousemaidRegController.dart';
import 'package:house_maid_project/CustomWidgets/errorDialogue.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/address/proofofAddress.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/address/vaccinated.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  _KYCScreenState createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  final HousemaidRegistrationController registrationController =
      Get.find<HousemaidRegistrationController>();

  @override
  Widget build(BuildContext context) {
    // Use media queries to get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  // Back Button
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back when tapped
                    },
                    child: Image.asset(
                      'assets/images/backbutton.png',
                      width: screenWidth * 0.09, // Make back button responsive
                      height: screenWidth * 0.09,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Title
                  Text(
                    'We need to know your Identity',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Description
                  Text(
                    'To ensure the security of your account and comply with regulatory requirements, we need to verify your identity. You will be done in 5 minutes!',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: const Color(0xFF8391A1),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // List of KYC steps
                  _buildVerificationOption(
                    title: 'Identity Verification',
                    isVerified: true,
                    onTap: () {
                      // No action required, as this is already verified
                    },
                    screenWidth: screenWidth,
                  ),
                  Obx(() => _buildVerificationOption(
                        title: 'Proof of Address',
                        isVerified:
                            registrationController.addressProofPDF.value !=
                                null,
                        onTap: () {
                          // Navigate to Proof of Address Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProofOfAddressScreen(),
                            ),
                          );
                        },
                        screenWidth: screenWidth,
                      )),
                  Obx(() => _buildVerificationOption(
                        title: 'Vaccination Records',
                        isVerified:
                            registrationController.vaccinationProofPDF.value !=
                                null,
                        onTap: () {
                          if (registrationController.addressProofPDF.value !=
                              null) {
                            // Navigate to Vaccination Records Screen only if Proof of Address is verified
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VaccinatedScreen(),
                              ),
                            );
                          } else {
                            // Show an error dialog if Proof of Address is not verified
                            ErrorDialog.showError(context,
                                "Please complete Proof of Address verification first.");
                          }
                        },
                        screenWidth: screenWidth,
                      )),
                  const Spacer(),
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      // Check if all verifications are complete
                      if (registrationController.addressProofPDF.value !=
                              null &&
                          registrationController.vaccinationProofPDF.value !=
                              null) {
                        registrationController.submitAllFields(context);
                      } else {
                        // Show an error dialog if not all verifications are complete
                        ErrorDialog.showError(context,
                            "Please complete all verifications before submitting.");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEB0D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31),
                      ),
                      minimumSize: Size(double.infinity, screenHeight * 0.08),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
            // Full-Screen Loader
            Obx(() {
              if (registrationController.isLoading.value) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(
                          255, 218, 110, 146), // Pink color for the loader
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationOption({
    required String title,
    required bool isVerified,
    required VoidCallback onTap,
    required double screenWidth,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
        child: Row(
          children: [
            Icon(
              isVerified ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isVerified ? const Color(0xFFFEB0D9) : Colors.grey,
              size: screenWidth * 0.07, // Responsive icon size
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w500,
                  color: isVerified ? Colors.black : Colors.grey,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
