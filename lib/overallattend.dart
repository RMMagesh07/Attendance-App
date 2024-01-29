import 'package:flutter/material.dart';
import 'profile.dart';
import 'feedback.dart';
import 'mainhome.dart';

class OverallAttendPage extends StatefulWidget {
  @override
  _OverallAttendPageState createState() => _OverallAttendPageState();
}

class _OverallAttendPageState extends State<OverallAttendPage> {
  int _selectedIndex = 0;
  DateTime? _selectedDate;

  List<String> studentList = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
  ];

  Map<String, bool> attendanceData = {
    'Student 1': true,
    'Student 2': false,
    'Student 3': true,
    'Student 4': false,
    'Student 5': true,
    'Student 1': true,
    'Student 2': false,
    'Student 3': true,
    'Student 4': false,
    'Student 5': true,
    'Student 1': true,
    'Student 2': false,
    'Student 3': true,
    'Student 4': false,
    'Student 5': true,
    'Student 1': true,
    'Student 2': false,
    'Student 3': true,
    'Student 4': false,
    'Student 5': true,
  };

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
            Text('Attendance Report', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Class Name',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Icon(Icons.calendar_today),
                ),
              ],
            ),

            SizedBox(height: 16),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: studentList.map((student) {
                      return ListTile(
                        title: Text(student),
                        trailing: attendanceData[student] == true
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.close, color: Colors.red),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // Add your logic to generate the report
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                minimumSize: Size(200, 60),
              ),
              child: Text('Generate Report'),
            ),
          ],
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
