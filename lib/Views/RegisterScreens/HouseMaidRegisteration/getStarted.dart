import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_maid_project/CustomWidgets/NextButtonWidget.dart';
import 'package:house_maid_project/Views/RegisterScreens/HouseMaidRegisteration/QuestionsScreens/HousemaidBefore.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              // Back Button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back when tapped
                },
                child: Image.asset(
                  'assets/images/backbutton.png',
                  width: 36,
                  height: 36,
                ),
              ),
              const SizedBox(height: 20),
              // Welcome Text
              const Text(
                'Hello “Full Name”, Ready for next big opportunity?',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontFamily: 'Urbanist',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  letterSpacing: -0.32,
                ),
              ),
              const SizedBox(height: 30),
              // Description Texts
              _buildInfoRow(
                'assets/images/profile_icon.png', // Replace with your icon asset
                'Answer a few questions and start building your profile.',
              ),
              const SizedBox(height: 20),
              _buildInfoRow(
                'assets/images/apply_icon.png', // Replace with your icon asset
                'Apply for open roles or list services for clients to buy.',
              ),
              const SizedBox(height: 20),
              _buildInfoRow(
                'assets/images/payment_icon.png', // Replace with your icon asset
                'Get paid safely and know we’re there to help.',
              ),
              const Spacer(),
              // Footer Text
              const Center(
                child: Text(
                  'It only takes 5-10 minutes and you can edit it later.\nWe’ll save as you go.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Get Started Button
              CustomNextButton(
                text: 'Get Started',
                onPressed: () {
                  Get.to(() => HouseMaidBefore());
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String iconPath, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF000000),
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
