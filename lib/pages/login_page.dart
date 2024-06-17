// ignore_for_file: unused_field

import 'package:abbyride/styles/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // Center the form both vertically and horizontally
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        constraints: const BoxConstraints(
          // Set maximum width and height
          maxWidth: 500.0, // Adjust as desired
          maxHeight: 500.0, // Adjust as desired
        ),
        decoration: BoxDecoration(
          color: Colors.white, // Set form container background color
          boxShadow: [
            // Add shadow effect
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.5), // Shadow color with transparency
              offset: const Offset(0, 5), // Offset the shadow slightly down
              blurRadius: 10.0, // Blur radius for a softer shadow
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.all(20.0), // Add padding around form elements
          child: Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login Heading
                Image.asset(width: 60, height: 60, "assets/icons/cross.png"),
                const SizedBox(height: 20.0),
                const Text(
                  'Login ',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),

                // Email Field
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align label to the left
                  children: [
                    const Text(
                      'Email', // Label text
                      style: TextStyle(
                        //  label style
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                        height:
                            5.0), // Add a small spacing between label and field
                    TextFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue,
                              width:
                                  2.0), // Optional: Different border for focus
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address.';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _email = newValue!,
                    ),
                  ],
                ),

                const SizedBox(height: 10.0),

                // Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Password', // Label text
                      style: TextStyle(
                        //  label style
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Set icon based on password visibility
                            _showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () =>
                              setState(() => _showPassword = !_showPassword),
                        ),
                      ),
                      obscureText: _showPassword, // Control password visibility
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password.';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _password = newValue!,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),

                // Forgot Password Text
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(height: 20.0),

                // Login and Create Account Buttons (Row for parallel layout)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Handle login logic with email and password
                          Navigator.of(context).pushReplacementNamed('/home');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5.0), // Set small border radius
                        ),
                        backgroundColor:
                            AppColors.blue, // Set blue background color
                        foregroundColor: Colors.white, // Set white text color
                      ),
                      child: const Text('Log In'),
                    ),

                    // Create Account Button
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
