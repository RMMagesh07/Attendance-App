import 'package:flutter/material.dart';
import 'LoginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any logic you need for the splash screen, e.g., loading assets or data
    _navigateToMainPage();
  }

  void _navigateToMainPage() async {
    // Simulate a delay for demonstration purposes
    await Future.delayed(Duration(seconds: 2, milliseconds: 700));

    // Navigate to the main page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // You can replace this placeholder with your video player widget
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color to full white
        child: Center(
          child: Image(
            image: AssetImage("images/ABI LOGO.gif"),
            width: 600.0, // Adjust width as needed
            height: 700.0, // Adjust height as needed
          ),
        ),
      ),
    );
  }
}
