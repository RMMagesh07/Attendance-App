import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class StudentAttendPage extends StatefulWidget {
  @override
  _StudentAttendPageState createState() => _StudentAttendPageState();
}

class _StudentAttendPageState extends State<StudentAttendPage> {
  int _selectedIndex = 0;
  String? _selectedSemester;

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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Student Attendance Report',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4),
            // Registration Number Textfield
            TextField(
              decoration: InputDecoration(
                hintText: 'Reg.No',
              ),
            ),
            SizedBox(height: 8),
            // Semester Dropdown
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text('Sem'),
                    value: _selectedSemester,
                    onChanged: (value) {
                      setState(() {
                        _selectedSemester = value;
                      });
                    },
                    items: [
                      'I',
                      'II',
                      'III',
                      'IV',
                      'V',
                      'VI',
                      'VII',
                      'VIII',
                    ].map((semester) {
                      return DropdownMenuItem<String>(
                        value: semester,
                        child: Text(semester),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16),
                // Search Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Add your search logic here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    minimumSize: Size(150, 40),
                  ),
                  icon: Icon(Icons.search),
                  label: Text('Search'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Big Box with Scrollable Table
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Si.No')),
                      DataColumn(label: Text('Subjects')),
                      DataColumn(label: Text('Attendance')),
                      DataColumn(label: Text('%')),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Subject1')),
                        DataCell(Text('70/90')),
                        DataCell(Text('80%')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Subject2')),
                        DataCell(Text('72/90')),
                        DataCell(Text('82%')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3')),
                        DataCell(Text('Subject3')),
                        DataCell(Text('69/80')),
                        DataCell(Text('79%')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('4')),
                        DataCell(Text('Subject4')),
                        DataCell(Text('70/90')),
                        DataCell(Text('78%')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('5')),
                        DataCell(Text('Subject5')),
                        DataCell(Text('73/90')),
                        DataCell(Text('80%')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('')),
                        DataCell(Text('Overall')),
                        DataCell(Text('81/90')),
                        DataCell(Text('80%')),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            // Generate Report Button
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
}
