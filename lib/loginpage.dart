import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'adminlogin.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('images/img.png'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/abilogo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                      // Perform login logic
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.white;
                          }
                          return Colors.cyan;
                        },
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(8),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(Size(150, 40)), // Set your desired button size
                    ),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 18, color: Colors.white), // Adjusted font size to 18
                    ),
                  ),

                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminLoginPage()),
                      );
                      // Perform login logic
                    },
                    child: Text(
                      'Admin',
                      style: TextStyle(

                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      // Navigate to the registration page
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(

                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
