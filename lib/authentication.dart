import 'package:flutter/material.dart';
// import 'package:i_explore/login.dart';
// import 'package:i_explore/register.dart';
import 'package:i_explore/pages/register.dart';
import 'package:i_explore/pages/login.dart';

Color orangeOneColor = const Color(0xFFD25017);
Color orangeTwoColor = const Color(0xFFDD6614);
Color orangeThreeColor = const Color(0xFFE0750F);

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
              ),
              Center(
                child: Image.asset(
                  'images/iexplore-logo.png',
                  width: 250,
                  height: 250,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
              ),
              const Center(
                child: Text(
                  "iExplore PH",
                  style: TextStyle(
                      fontFamily: 'AdobeDevanagari',
                      fontStyle: FontStyle.normal,
                      fontSize: 60,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
              ),
              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontFamily: "AdobeDevanagari",
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
              ),
              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: "AdobeDevanagari",
                        fontStyle: FontStyle.normal,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
