import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SignInForm(),
    );
  }
}

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 12),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add your sign-in logic here
            },
            child: Text('Sign In'),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              // Add your "Forgot Password" logic here
            },
            child: Text('Forgot Password?'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  // Add your Facebook sign-in logic here
                },
                icon: Icon(Icons.facebook),
              ),
              IconButton(
                onPressed: () {
                  // Add your Google sign-in logic here
                },
                icon: Icon(Icons.ac_unit_sharp),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Don\'t have an account?'),
          TextButton(
            onPressed: () {
              // Add your sign-up page navigation logic here
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    ));
  }
}
