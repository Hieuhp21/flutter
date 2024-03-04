import 'package:brand/screens/toDoListScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  void validateLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        errorMessage = 'Email không hợp lệ.';
      });
      return;
    }

    if (password.length < 4) {
      setState(() {
        errorMessage = 'Mật khẩu phải có ít nhất 4 ký tự.';
      });
      return;
    }

    if (email == 'student@aptech.com.vn' && password == 'aptech123') {
      setState(() {

        errorMessage = 'Đăng nhập thành công.';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TodoListScreen()),
      );
    } else {
      setState(() {
        errorMessage = 'Email hoặc mật khẩu không chính xác.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Brand',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity, // Match parent width
                  child: ElevatedButton(
                    onPressed: () {
                      validateLogin();
                    },
                    child: Text('Login'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Forgot password functionality
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                '--------- or ---------',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity, // Match parent width
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Under Construction'),
                            content: Text('Tính năng này đang được xây dựng.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.facebook, color: Colors.white),
                    label: Text('Login with Facebook', style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
