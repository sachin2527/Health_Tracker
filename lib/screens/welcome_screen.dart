import 'package:health_app/screens/login_screen.dart';
import 'package:health_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'admin_login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight, // Align to the top right corner
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    // Handle admin login here, navigate to admin panel or login screen
                    // Replace 'AdminLoginScreen()' with your admin login logic/screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Admin Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Adjust the font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  //  Navigator.push(context, MaterialPageRoute(
                  //  builder: (context) => NavBarRoots(),
                  //  ));
                },
                child: Text(
                  " ",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(1),
              child: Image.asset("assets/images/login.jpg"),
            ),
            SizedBox(height: 60),
            Text(
              "Health Tracker",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 47,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Check your Heart rate & SPO2",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 170),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        "LogIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
}
