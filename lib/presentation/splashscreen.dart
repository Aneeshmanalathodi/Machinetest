import 'package:flutter/material.dart';
import 'package:machine_test_lilac/presentation/phonenumber.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/808f1e2e679edf7a7dff2065130238978ad11f71.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Text(
                  "Connect.Meet.Love. \nWith Fliq Dating",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 40.0,
                ),
                child: Column(
                  spacing: 8,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Phonenumber()),
                        );
                      },
                      icon: Image.asset(
                        'assets/images/google.png',
                        height: 20,
                        width: 20,
                      ),
                      label: Text(
                        'Sign in with Google',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                          fixedSize: Size(280, 40)),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Phonenumber()),
                        );
                      },
                      icon: Image.asset(
                        'assets/images/f.png',
                        height: 20,
                        width: 20,
                      ),
                      label: Text(
                        'Sign in with Facebook',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                          fixedSize: Size(280, 40)),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Phonenumber()),
                        );
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      label: Text(
                        'Sign in with Number',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                          fixedSize: Size(280, 40)),
                    ),
                    SizedBox(
                      width: 280,
                      child: Text(
                        'By signing up, you agree to our Terms see how we \nuse your data in our Privacy Policy',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
