import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: LoginPage()));

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';

  void _login() {
    // Your login logic here
    print('Login with $_username and $_password');
    // If login is successful, navigate to another screen.
    // Navigator.of(context).pushReplacementNamed(AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], // This sets the blue-black background color
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Spacer(),
                // Using Image.asset() instead of Placeholder
                Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/image/doro.webp'),
                ),
                SizedBox(height: 20),
                Text(
                  "Hello! Welcome!",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Login to continue",
                  style: TextStyle(color: Colors.amber),
                ),
                Spacer(),
                TextField(
                  onChanged: (value) => setState(() => _username = value),
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.amber.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: (value) => setState(() => _password = value),
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                    fillColor: Colors.amber.withOpacity(0.5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => print('Forgot is clicked'),
                    style: TextButton.styleFrom(foregroundColor: Colors.amber),
                    child: Text("Forgot Password?"),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: Text("Login"),
                  ),
                ),
                Spacer(),
                Text(
                  "Or Sign In With",
                  style: TextStyle(color: Colors.amber),
                ),
                SizedBox(height: 16),
                // Add your social login buttons here (e.g., Google, Facebook)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.amber),
                    ),
                    TextButton(
                      onPressed: () => print('Sign up clicked'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
