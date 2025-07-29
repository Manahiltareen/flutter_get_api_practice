// lib/View/Auth/login_page.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_reviews/View/post_api/widgets/neumorphic_container.dart';
import 'package:google_fonts/google_fonts.dart';
// Import the custom widget

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _keepMeLoggedIn = false; // State for the checkbox

  // Define your custom colors that match the image
  static const Color _backgroundColor = Color(0xFFE8E9EC); // Overall light background
  static const Color _primaryPurple = Color(0xFF6B72DF); // Primary button color
  static const Color _lightPurple = Color(0xFF8C91E5); // Button highlight/shadow color
  static const Color _textColor = Color(0xFF333333); // Dark text color
  static const Color _hintColor = Color(0xFFAAAAAA); // Placeholder text color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: NeumorphicContainer(
                backgroundColor: _backgroundColor,
                borderRadius: 30.0, // Larger border radius for the main container
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0), // Margin from screen edges
                depth: 10.0,
                shape: NeumorphicShape.flat, // Main container is flat but has soft shadows
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      style: GoogleFonts.poppins(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: _textColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Welcome back",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: _textColor.withOpacity(0.7),
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Username Input Field
                    NeumorphicContainer(
                      backgroundColor: _backgroundColor,
                      borderRadius: 12.0,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      depth: 2.0, // Smaller depth for inset
                      shape: NeumorphicShape.concave, // Inset effect
                      child: TextFormField(
                        style: GoogleFonts.poppins(color: _textColor),
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: GoogleFonts.poppins(color: _hintColor),
                          border: InputBorder.none, // Remove default border
                          isDense: true, // Make it more compact
                          contentPadding: EdgeInsets.zero, // Remove default padding
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Input Field
                    NeumorphicContainer(
                      backgroundColor: _backgroundColor,
                      borderRadius: 12.0,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      depth: 2.0, // Smaller depth for inset
                      shape: NeumorphicShape.concave, // Inset effect
                      child: TextFormField(
                        obscureText: true, // Hide password text
                        style: GoogleFonts.poppins(color: _textColor),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(color: _hintColor),
                          border: InputBorder.none, // Remove default border
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // "Keep me logged in" Checkbox
                    Row(
                      children: [
                        SizedBox(
                          width: 20, // Control size of checkbox
                          height: 20,
                          child: Checkbox(
                            value: _keepMeLoggedIn,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _keepMeLoggedIn = newValue ?? false;
                              });
                            },
                            activeColor: _primaryPurple, // Color when checked
                            checkColor: Colors.white, // Color of the checkmark
                            fillColor: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return _primaryPurple; // Checked color
                              }
                              return _backgroundColor; // Unchecked background color
                            }),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4), // Slightly rounded square
                              side: BorderSide(
                                color: _hintColor.withOpacity(0.6), // Border color when unchecked
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Keep me logged in",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: _textColor.withOpacity(0.8),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Log in Button
                    NeumorphicContainer(
                      backgroundColor: _primaryPurple, // Button background color
                      borderRadius: 12.0,
                      padding: EdgeInsets.zero, // No internal padding as button handles it
                      depth: 8.0,
                      shape: NeumorphicShape.convex, // Raised effect for button
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                      child: Material( // Use Material to enable inkwell/splash effect
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {
                            // TODO: Implement login logic
                            print("Log In button pressed!");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Text(
                              "Log In",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Fingerprint Icon Button (positioned top right)
            Positioned(
              top: MediaQuery.of(context).padding.top + 20, // Respect safe area
              right: 20,
              child: NeumorphicContainer(
                backgroundColor: _backgroundColor,
                borderRadius: 15.0, // Border radius for the fingerprint button
                depth: 5.0,
                shape: NeumorphicShape.convex, // Raised effect
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap: () {
                    // TODO: Implement biometric login
                    print("Fingerprint icon pressed!");
                  },
                  child: const Icon(
                    FontAwesomeIcons.fingerprint, // Using Font Awesome icon
                    color: _primaryPurple, // Icon color
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}