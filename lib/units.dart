import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';



class UnitListPage extends StatelessWidget {
  final String unitName;
  int _selectedIndex = 0;

  UnitListPage({required this.unitName});

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
            Text('Units', style: TextStyle(fontSize: 40)),
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
                '$unitName',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Assuming 5 units
              itemBuilder: (BuildContext context, int index) {
                return buildUnitButton(context, index + 1);
              },
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

  Widget buildUnitButton(BuildContext context, int unitNumber) {
    return GestureDetector(
      onTap: () {
        // Open the popup when a unit button is clicked
        _showSyllabusPopup(context, unitNumber);
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.6, // Adjust the width as needed
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Add horizontal margin
        decoration: BoxDecoration(
          color: Colors.blue, // Adjust the color as needed
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Unit $unitNumber',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _showSyllabusPopup(BuildContext context, int unitNumber) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Unit $unitNumber Syllabus',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Enter Syllabus Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle submit button action
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                      ),
                      child: Text('Submit'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text('Close'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
