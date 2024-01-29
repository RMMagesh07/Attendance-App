import 'package:attendance_app/profileupdate.dart';
import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'loginpage.dart'; // Import your login page file here

class ProfilePage extends StatelessWidget {
  int _selectedIndex = 1;

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
            Text('Profile', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Hi Username',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Name: Your Name', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Username: YourUsername', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('College Name: Your College Name', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show the update profile popup
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    TextEditingController collegeCodeController = TextEditingController();
                    TextEditingController passwordController = TextEditingController();

                    return AlertDialog(
                      title: Text('Update Profile'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: collegeCodeController,
                            decoration: InputDecoration(labelText: 'College Code'),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(labelText: 'Password'),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle the submit action here
                            // You can access collegeCodeController.text and passwordController.text
                            Navigator.of(context).pop(); // Close the dialog

                            // Navigate to the new page after submitting
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfUpdatePage(), // Replace 'NewPage' with your actual page
                              ),
                            );
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan, // Change the button color
                onPrimary: Colors.black, // Change the text color
                padding: EdgeInsets.all(20), // Adjust the padding
                minimumSize: Size(double.infinity, 60), // Make the button take the full width
              ),
              child: Text('Update Profile'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan, // Change the button color
                onPrimary: Colors.black, // Change the text color
                padding: EdgeInsets.all(20), // Adjust the padding
                minimumSize: Size(double.infinity, 60), // Make the button take the full width
              ),
              child: Text('Logout'),
            ),
          ],
        ),
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
}
