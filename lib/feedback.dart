import 'package:flutter/material.dart';
import 'aboutus.dart';
import 'help.dart';
import 'mainhome.dart';
import 'profile.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thank You'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank You for Your Feedback!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous page (FeedbackPage)
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  int _selectedIndex = 2;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  void _sendFeedback(BuildContext context) async {
    String name = nameController.text;
    String email = emailController.text;
    String feedback = feedbackController.text;

    // Configure the SMTP server details
    final smtpServer = gmail('ramsuryaagp18@gmail.com', 'guqu xflx ikpw ohzr'); // Replace with your email and password

    // Create the email message
    final message = Message()
      ..from = Address('ramsuryaagp18@gmail.com', name) // Use the user's email and name
      ..recipients.add('ramsuryaagp18@gmail.com') // Replace with your personal email
      ..subject = 'Feedback from $name'
      ..text = feedback;

    try {
      // Send the email
      await send(message, smtpServer);

      // Navigate to ThankYouPage after sending feedback
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThankYouPage()),
      );
    } catch (e) {
      print('Error sending feedback: $e');
    }
  }

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
            Text('Edu-Log', style: TextStyle(fontSize: 40)),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpPage()),
                );
              },
              icon: Icon(Icons.help_outline, size: 30),
            ),
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
                  'Feedback',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Feedback'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _sendFeedback(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                onPrimary: Colors.black,
                padding: EdgeInsets.all(20),
                minimumSize: Size(double.infinity, 60),
              ),
              child: Text('Send Feedback'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsPage()),
                );
              },
              child: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
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
