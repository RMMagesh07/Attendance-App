import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class TimeTablePage extends StatefulWidget {
  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  int _selectedIndex = 0;

  List<String> periods = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII'];
  List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  List<List<String>> subjects = List.generate(
    7, // Number of periods
        (index) => List.generate(7, (index) => 'subject1'), // Number of days
  );

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
            Text('TimeTable', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Time Table',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Class Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              buildTimetable(),
              SizedBox(height: 16), // Add some space between table and button
              ElevatedButton(
                onPressed: () {
                  // Handle Edit Table button click
                  // Add your logic here
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 60), // Set a minimum size
                ),
                child: Text('Edit Table', style: TextStyle(fontSize: 20)),
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

  Widget buildTimetable() {
    return DataTable(
      columnSpacing: 2.0, // Adjust the spacing between columns
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Set border color for the table
      ),
      columns: [
        DataColumn(
          label: Container(
            width: 100, // Adjust the width of the Period/Day column
            child: Text(
              'Period/Day',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        for (var period in periods)
          DataColumn(
            label: Container(
              width: 100, // Adjust the width of other columns
              child: Text(
                period,
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
      rows: [
        for (int i = 0; i < days.length; i++)
          DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100, // Adjust the width of the Period/Day cell
                  child: Text(
                    days[i],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              for (int j = 0; j < periods.length; j++)
                DataCell(
                  Container(
                    width: 100, // Adjust the width of other cells
                    child: DropdownButton<String>(
                      value: subjects[i][j],
                      onChanged: (value) {
                        setState(() {
                          // Update the subject when a new one is selected
                          subjects[i][j] = value!;
                        });
                      },
                      items: [
                        for (var subject in ['subject1', 'subject2', 'subject3', 'subject4', 'subject5'])
                          DropdownMenuItem<String>(
                            value: subject,
                            child: Text(subject),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
