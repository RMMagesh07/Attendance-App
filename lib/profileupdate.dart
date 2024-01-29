import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'profile.dart';
import 'feedback.dart';

class ProfUpdatePage extends StatefulWidget {
  int _selectedIndex = 1;

  @override
  _ProfUpdatePageState createState() => _ProfUpdatePageState();
}

class _ProfUpdatePageState extends State<ProfUpdatePage> {
  DateTime? selectedDate;
  String? selectedDesignation;

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
            Text('College name', style: TextStyle(fontSize: 40)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildTextField(
                label: 'Name',
                height: 60,
                icon: Icons.person,
              ),
              SizedBox(height: 20),
              buildTextField(
                label: 'Username',
                height: 60,
                icon: Icons.account_circle,
              ),
              SizedBox(height: 20),
              buildTextField(
                label: 'College Name',
                height: 60,
                icon: Icons.school,
              ),
              SizedBox(height: 20),
              buildDateField(
                label: 'DOB',
                height: 60,
                icon: Icons.calendar_today,
              ),
              SizedBox(height: 20),
              buildTextField(
                label: 'Email',
                height: 60,
                icon: Icons.email,
              ),
              SizedBox(height: 20),
              buildTextField(
                label: 'Ph.No',
                height: 60,
                icon: Icons.phone,
              ),
              SizedBox(height: 20),
              buildDropdownField(
                label: 'Designation',
                height: 60,
                icon: Icons.work,
              ),
              SizedBox(height: 20),
              buildTextField(
                label: 'Password',
                height: 60,
                icon: Icons.lock,
                isPassword: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the submit action here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.all(20),
                  minimumSize: Size(double.infinity, 60),
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan,
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
    );
  }

  Widget buildTextField({
    required String label,
    required double height,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      height: height,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDateField({
    required String label,
    required double height,
    required IconData icon,
  }) {
    return Container(
      height: height,
      child: InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(),
          ),
          child: Text(selectedDate != null
              ? "${selectedDate!.toLocal()}".split(' ')[0]
              : ''),
        ),
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    required double height,
    required IconData icon,
  }) {
    List<String> designations = [
      'Principal',
      'Dean',
      'HOD',
      'Professor',
      'Asst. Professor',
    ];

    return Container(
      height: height,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedDesignation,
            onChanged: (String? newValue) {
              setState(() {
                selectedDesignation = newValue;
              });
            },
            items: designations.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
