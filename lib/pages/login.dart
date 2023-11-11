import 'package:flutter/material.dart';
import 'package:projeto/pages/widgets/baseWidget.dart';
import 'package:projeto/pages/signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _obscurePassword = true; // Flag para indicar se a senha está obscurecida
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF000B45),
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromARGB(255, 33, 52, 148),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Username',
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
            SizedBox(height: 35.0),
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
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BaseWidget()),
                );
                // Implement your login logic here
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
                child: Text('LogIn'),
              ),
            ),
            SizedBox(height: 16.0),
            OutlinedButton.icon(
              onPressed: () {
                // Implement Google login logic here
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              icon: Icon(Icons.g_translate, color: Colors.white),
              label: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Don't have an account?",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
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
                  'Sign Up',
                  style: TextStyle(color: Color(0xFF000B45)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
