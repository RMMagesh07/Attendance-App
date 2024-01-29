import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class AboutUsPage extends StatelessWidget {
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
            Text('About Us',
                style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Meet Our Team',
              style: TextStyle(
                fontSize:42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircleRow(
                context,
                'Abirami.K',
                'Developer',
                'Hi,I am Abi',
                'images/abi.jpg', // Replace with the path to your image
              ),
              _buildCircleRow(
                context,
                'Surya.R',
                'Developer',
                'Hi,I am Surya',
                'images/surya.png', // Replace with the path to your image
              ),
              _buildCircleRow(
                context,
                'Mari Magesh.R',
                'Frontend Dev',
                'Hi, I am Mari',
                'images/mari.jpg', // Replace with the path to your image
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCircleRow(
                context,
                'Siva Sankaran.S',
                'Backend Dev',
                'Hi, I am Siva',
                'images/siva.png', // Replace with the path to your image
              ),
              _buildCircleRow(
                context,
                'Shanmuga Priya',
                'Developer',
                'Hi, I am Shabi',
                'images/shabi.jpg', // Replace with the path to your image
              ),
            ],
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

  Widget _buildCircleRow(
      BuildContext context, String name, String role, String description, String imagePath) {
    return Column(
      children: [
        InkWell(
          onTap: () => _showPopup(context, name, role, description, imagePath),
          child: Container(
            margin: EdgeInsets.all(10),
            width: 120,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          role,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  void _showPopup(
      BuildContext context, String name, String role, String description, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 250, // Adjust the width of the dialog as needed
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 150, // Adjust the width of the image as needed
                  height: 150, // Adjust the height of the image as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(), // Center widget for centering the image
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(role),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(description),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
