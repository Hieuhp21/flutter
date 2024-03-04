import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/signInPage.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Image(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
                width: screenWidth,
                height: screenHeight,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hello', style: TextStyle(fontSize: 60, color: Colors.black)),
                    const Text('This is test', style: TextStyle(fontSize: 20, color: Colors.black)),
                    Expanded(child: Container()),
                    Container(
                      height: screenHeight * 0.25,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignInPage()),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5, // Độ nổi
                            ),
                            child: SizedBox(
                              width: screenWidth * 0.5,
                              child: Center(
                                child: Text('Sign in'),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Add your onTap logic here
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5, // Độ nổi
                            ),
                            child: SizedBox(
                              width: screenWidth * 0.5,
                              child: Center(
                                child: Text('Sign up'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
