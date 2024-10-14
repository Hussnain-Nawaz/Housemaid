import 'package:flutter/material.dart';

class ProfileTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // Background color

        // Column layout to separate the fixed header from the scrollable content
        body: Column(
          children: [
            // Fixed Profile Header
            _buildProfileHeader(),

            // Scrollable content below the fixed header
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      _buildSection('Sellings', [
                        _buildSettingsOption(Icons.attach_money, 'Earnings'),
                        _buildSettingsOption(Icons.share, 'Share Profile'),
                        _buildSettingsOption(Icons.access_time, 'Availability'),
                        _buildSettingsOption(Icons.feedback, 'My Feedbacks'),
                      ]),
                      const SizedBox(height: 16),
                      _buildSection('Setting', [
                        _buildSettingsOption(
                            Icons.settings, 'Account Settings'),
                        _buildSettingsOption(Icons.lock, 'Change Password'),
                      ]),
                      const SizedBox(height: 16),
                      _buildSection('Support', [
                        _buildSettingsOption(
                            Icons.help_outline, 'Help & Support'),
                        _buildSettingsOption(Icons.policy, 'Privacy Policy'),
                      ]),
                      const SizedBox(height: 16),
                      _buildLogoutButton(), // Logout button
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Profile header with avatar and balance (Fixed at the top)
  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 40),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profileimage.jpg'), // Replace with your image path
              radius: 30.0,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Personal Balance: \$1000.00',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFEB0D9),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Section title with options list
  Widget _buildSection(String title, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        ...options, // List of settings options
      ],
    );
  }

  // Single settings option widget
  Widget _buildSettingsOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
        ],
      ),
    );
  }

  // Logout button widget
  Widget _buildLogoutButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle logout action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFEB0D9),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
