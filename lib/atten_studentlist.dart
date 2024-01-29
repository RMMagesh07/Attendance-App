import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'feedback.dart';
import 'profile.dart';

class StudentListPage extends StatefulWidget {
  final String className;
  int _selectedIndex = 0;

  StudentListPage({required this.className});

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<String> studentsList = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 6',
    'Student 7',
    'Student 8',
    'Student 9',
    'Student 10',
    'Student 11',
    'Student 12',
    'Student 13',
    'Student 14',
    'Student 15',
    'Student 16',
    'Student 17',
    'Student 18',
    'Student 19',
    'Student 20',
    'Student 21',
    'Student 22',
    'Student 23',
    'Student 24',
    'Student 25',
  ];

  List<String> attendanceList = List.filled(25, ''); // List to store 'P' or 'A' for each student

  @override
  Widget build(BuildContext context) {
    int presentCount = attendanceList.where((status) => status == 'P').length;
    int absentCount = attendanceList.where((status) => status == 'A').length;

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
            Text('Today Class', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                '${widget.className}',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: studentsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildStudentRow(studentsList[index], index);
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan, // Change the selected item color
        iconSize: 40.0,
        currentIndex: widget._selectedIndex,
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
          setState(() {
            widget._selectedIndex = index;
          });
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
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle the submit button press
                _showWorkDoneDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              'Present: $presentCount',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Absent: $absentCount',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStudentRow(String studentName, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              studentName,
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      attendanceList[index] = 'P';
                    });
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: attendanceList[index] == 'P'
                            ? Colors.cyan
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: attendanceList[index] == 'P'
                              ? Colors.transparent
                              : Colors.cyan,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'P',
                          style: TextStyle(
                            fontSize: 18,
                            color: attendanceList[index] == 'P'
                                ? Colors.black
                                : Colors.cyan,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    setState(() {
                      attendanceList[index] = 'A';
                    });
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: attendanceList[index] == 'A'
                            ? Colors.red
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: attendanceList[index] == 'A'
                              ? Colors.transparent
                              : Colors.red,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'A',
                          style: TextStyle(
                            fontSize: 18,
                            color: attendanceList[index] == 'A'
                                ? Colors.black
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showWorkDoneDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Work Done'),
          content: Container(
            height: 150, // Adjust the height as needed
            child: Column(
              children: [
                TextField(
                  maxLines: 5, // Increase the number of lines
                  decoration: InputDecoration(
                    labelText: 'Enter your work here',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
