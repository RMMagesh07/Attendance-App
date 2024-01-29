import 'package:flutter/material.dart';
import 'profile.dart';
import 'feedback.dart';
import 'mainhome.dart';
import 'subjectwiseattend.dart';
import 'overallattend.dart';
import 'studentattend.dart';



class DropdownItem {
  final String value;
  final String label;

  DropdownItem(this.value, this.label);
}

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int _selectedIndex = 0;

  // Initialize dropdown values
  DropdownItem? _programValue;
  DropdownItem? _courseValue;
  DropdownItem? _semesterValue;
  DropdownItem? _deptValue;
  DropdownItem? _yearValue;
  DropdownItem? _sectionValue;
  DropdownItem? _attendanceViseValue;

  // Dropdown data
  List<DropdownItem> programItems = [
    DropdownItem('1', 'U.G'),
    DropdownItem('2', 'P.G'),
  ];

  List<DropdownItem> courseItems = [
    DropdownItem('1', 'B.E'),
    DropdownItem('2', 'M.E'),
    DropdownItem('3', 'M.B.A'),
  ];

  List<DropdownItem> semesterItems = [
    DropdownItem('I', 'I'),
    DropdownItem('II', 'II'),
    DropdownItem('III', 'III'),
    DropdownItem('IV', 'IV'),
    DropdownItem('V', 'V'),
    DropdownItem('VI', 'VI'),
    DropdownItem('VII', 'VII'),
    DropdownItem('VIII', 'VIII'),
  ];

  List<DropdownItem> deptItems = [
    DropdownItem('C.S.E', 'C.S.E'),
    DropdownItem('Mech', 'Mech'),
    DropdownItem('Civil', 'Civil'),
    DropdownItem('EEE', 'EEE'),
    DropdownItem('ECE', 'ECE'),
    DropdownItem('Aero', 'Aero'),
    DropdownItem('Marine', 'Marine'),
  ];

  List<DropdownItem> yearItems = [
    DropdownItem('I', 'I'),
    DropdownItem('II', 'II'),
    DropdownItem('III', 'III'),
    DropdownItem('IV', 'IV'),
  ];

  List<DropdownItem> sectionItems = [
    DropdownItem('A', 'A'),
    DropdownItem('B', 'B'),
    DropdownItem('C', 'C'),
    DropdownItem('D', 'D'),
    DropdownItem('E', 'E'),
    DropdownItem('F', 'F'),
  ];

  List<DropdownItem> attendanceViseItems = [
    DropdownItem('Subject', 'Subject'),
    DropdownItem('Overall', 'Overall'),
    DropdownItem('Student', 'Student'),
  ];

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
            Text('Attendance Reports', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Attendance Reports Text
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Attendance Reports',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Dropdown Boxes
              buildDropdownBox('Program', programItems, _programValue, (DropdownItem? value) {
                setState(() {
                  _programValue = value;
                });
              }),
              SizedBox(height: 8),  // Reduce the gap
              buildDropdownBox('Course', courseItems, _courseValue, (DropdownItem? value) {
                setState(() {
                  _courseValue = value;
                });
              }),
              SizedBox(height: 8),  // Reduce the gap
              buildDropdownBox('Semester', semesterItems, _semesterValue, (DropdownItem? value) {
                setState(() {
                  _semesterValue = value;
                });
              }),
              SizedBox(height: 8),  // Reduce the gap
              buildDropdownBox('Dept', deptItems, _deptValue, (DropdownItem? value) {
                setState(() {
                  _deptValue = value;
                });
              }),
              SizedBox(height: 8),  // Reduce the gap
              buildDropdownBox('Year', yearItems, _yearValue, (DropdownItem? value) {
                setState(() {
                  _yearValue = value;
                });
              }),
              SizedBox(height: 8),  // Reduce the gap
              buildDropdownBox('Section', sectionItems, _sectionValue, (DropdownItem? value) {
                setState(() {
                  _sectionValue = value;
                });
              }),
              SizedBox(height: 8),  // Reduce the gap
              buildDropdownBox('Attendance Vise', attendanceViseItems, _attendanceViseValue, (DropdownItem? value) {
                setState(() {
                  _attendanceViseValue = value;
                });
              }),
              SizedBox(height: 16),  // Increase the gap
              // Search Button
              // Search Button
              ElevatedButton.icon(
                onPressed: () {
                  // Add your search logic here
                  if (_attendanceViseValue?.value == 'Subject') {
                    // Navigate to SubjectViseAttendPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubjectViseAttendPage()),
                    );
                  } else if (_attendanceViseValue?.value == 'Overall') {
                    // Navigate to OverallAttendPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OverallAttendPage()),
                    );
                  }else if (_attendanceViseValue?.value == 'Student') {
                    // Navigate to OverallAttendPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentAttendPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  minimumSize: Size(200, 60),  // Set a minimum size
                ),
                icon: Icon(Icons.search, color: Colors.black),
                label: Text(
                  'Search',
                  style: TextStyle(color: Colors.black),
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

  // Function to create a Dropdown Box
  Widget buildDropdownBox(String hintText, List<DropdownItem> items, DropdownItem? value, void Function(DropdownItem?) onChanged) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8.0),  // Adjust margin as needed
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<DropdownItem>(
          value: value,
          onChanged: onChanged,
          hint: Text(hintText),
          isExpanded: true,  // Make the dropdown button take full width
          elevation: 16,
          style: TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.cyan,
          ),
          items: items.map((item) {
            return DropdownMenuItem<DropdownItem>(
              value: item,
              child: Text(item.label),
            );
          }).toList(),
        ),
      ),
    );
  }

}

