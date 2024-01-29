import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class ClgInfoPage extends StatelessWidget {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('College Info'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Larger round-shaped image at the top
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/clg logo.png'), // Replace with the actual image path
                ),
              ),

              // Gap between sections
              SizedBox(height: 16),

              // Section 1
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'COLLEGE NAME',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Gap between sections
              SizedBox(height: 16),

              // Section 2
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'COLLEGE ADDRESS',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Gap between sections
              SizedBox(height: 16),

              // Section 3
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'COLLEGE EMAIL',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Gap between sections
              SizedBox(height: 16),

              // Section 4
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'COLLEGE CONTACT',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // Gap between sections
              SizedBox(height: 16),

              // Section 5
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'COLLEGE DESCRIPTION',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan,
        iconSize: 40.0,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined),
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
}
