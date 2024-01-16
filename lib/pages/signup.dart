import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto/pages/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //for JSONencode

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscurePassword = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> register() async {
    String apiUrl = 'https://backend-q4m5.onrender.com/register';

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Registration successful
        print('Registration successful');
        // You may check for specific success conditions here if needed

        // Proceed to login screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LogIn()),
        );
      } else if (response.statusCode == 409) {
        // Duplicated user error
        print('Duplicated user error');
        // Show popup with error message
        showRegistrationErrorPopup(
            'Duplicated user. Please use a different email.');
      } else {
        // An error occurred
        print('Error in registration');
        // Show popup with a general error message
        showRegistrationErrorPopup('An error occurred during registration.');
      }
    } catch (e) {
      print('Error connecting to the API: $e');
      // Show popup with network error message
      showRegistrationErrorPopup(
          'Error connecting to the server. Please try again later.');
    }
  }

  void showRegistrationErrorPopup(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000B45), // 100%
              Color(0xFF000B45).withOpacity(0.75), // 75%
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF000B45),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF000B45),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                style: TextStyle(color: Colors.white),
                obscureText: _obscurePassword,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF000B45),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 44.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Call the login function
                    await register();
                  } catch (e) {
                    // Handle login errors
                    print('Error during login: $e');
                    showRegistrationErrorPopup(
                        'An unexpected error occurred. Please try again.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF000B45),
                  foregroundColor: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
                child: Container(
                  height: 36,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign up with Google',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      // Adicione a lógica de login do Google aqui
                    },
                    child: SvgPicture.asset(
                      'assets/icons/google.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Already have an account?',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFF000B45), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
                child: Container(
                  height: 36,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Color(0xFF000B45)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
