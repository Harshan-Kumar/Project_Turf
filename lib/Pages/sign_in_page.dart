import 'package:flutter/material.dart';
import 'package:turf_booking_app/Pages/Login_Page.dart';
import 'package:turf_booking_app/Pages/city_selection_page.dart';
import 'home_page.dart'; // Import the home page
import 'wave_clipper.dart'; // Import the wave clipper

void main() {
  runApp(TurfBookingApp());
}

class TurfBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: signinpage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}

class signinpage extends StatefulWidget {
  @override
  _signinpageState createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  bool isUserSelected = true; // Initially User is selected
  bool _isPasswordVisible = false; // Password visibility toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/turf_background.jpg'), // Add your background image in assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Wavy design at the top
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(74, 99, 83, 100),
                    Color.fromRGBO(172, 180, 113, 100)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              //color: Color.fromARGB(255, 255, 255, 255).withOpacity(1),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                // Circular Profile Placeholder
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/icon.png"),
                ),
                SizedBox(height: 100),
                // Login Text
                Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // User and Owner Buttons with animation
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // User Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isUserSelected = true;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: isUserSelected
                              ? Colors.white.withOpacity(0.8)
                              : Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('USER',
                            style: TextStyle(
                                color: isUserSelected
                                    ? Colors.black
                                    : Colors.white)),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Owner Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isUserSelected = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        decoration: BoxDecoration(
                          color: !isUserSelected
                              ? Colors.white.withOpacity(0.8)
                              : Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('OWNER',
                            style: TextStyle(
                                color: !isUserSelected
                                    ? Colors.black
                                    : Colors.white)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Email/Phone Number TextField
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email ID / Phone Number',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.7)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Password TextField with eye icon
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(0.7)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white.withOpacity(0.7),
                          size: 20, // Smaller eye icon
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Sign In Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CitySelectionPage(),
                        ));
                  },
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                // Register Text
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                    // Navigate to Register Page (implement if needed)
                  },
                  child: Text(
                    'New User? Register',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
