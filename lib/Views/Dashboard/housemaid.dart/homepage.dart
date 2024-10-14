import 'package:flutter/material.dart';
import 'package:house_maid_project/Views/Chats/chatsList.dart';
import 'package:house_maid_project/Views/Dashboard/housemaid.dart/homeTab.dart';
import 'package:house_maid_project/Views/Dashboard/housemaid.dart/profileTab.dart';

class HouseMaidDashboard extends StatefulWidget {
  @override
  _HouseMaidDashboardState createState() => _HouseMaidDashboardState();
}

class _HouseMaidDashboardState extends State<HouseMaidDashboard> {
  int _currentIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = [
    HouseMaidDashboardTab(), // Home tab

    Center(child: Text('Tasks Screen')), // Tasks placeholder
    ChatListScreen(
      currentUserId: '1',
      isHousemaid: true,
    ), //chat
    Center(child: Text('Chats Screen')), // Chats placeholder
    ProfileTabScreen(), // Profile tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex], // Display the selected screen

      // Custom BottomNavigationBar with a border on top
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black, // Black border on top
              width: 1.0, // Border thickness
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor:
              const Color.fromARGB(255, 242, 88, 165), // Pink for selected item
          unselectedItemColor: Colors.black, // Black for unselected items
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update tab index
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
