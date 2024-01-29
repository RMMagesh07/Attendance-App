import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class HelpPage extends StatelessWidget {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/ABI LOGO.png', // Adjust the path as needed
                width: 40,
                height: 40,
              ),
            ),
            Text('Help', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'How To Use ?',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tips for using the Attendance App:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildTip('1. Tip One: Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                  _buildTip('2. Tip Two: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                  _buildTip('3. Tip Three: Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.'),
                  _buildTip('4. Tip Four: Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
                  _buildTip('5. Tip Five: Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan, // Change the selected item color
        iconSize: 40.0,
        currentIndex: _selectedIndex, // Change the size of the icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), // Change the icon for the second item
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), // Change the icon for the first item
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined), // Change the icon for the third item
            label: 'Feedback',
          ),
        ],
        onTap: (int index) {
          // Add your navigation logic here
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildTip(String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        tip,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
