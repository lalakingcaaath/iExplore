import 'package:flutter/material.dart';
import 'package:i_explore/components/HeaderComponent.dart';
import 'package:i_explore/components/TextFieldComponent.dart';
import 'package:i_explore/pages/homepage.dart';
import 'package:i_explore/pages/register.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/utils/validator.dart';
import 'package:provider/provider.dart';

import '../services/AuthService.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _signInUser(String email, String password) async {
    AuthService authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInUser(email, password);
      // Navigate to home page after successful authentication
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "iExplore")),
      );
    } catch (e) {
      // Handle authentication errors (e.g., show error dialog)
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to login: ${e.toString()}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderSection(
                imageSrc: 'images/iexplore-logo.png',
                logoTitle: 'iExplore',
              ),
              const SizedBox(height: 25),
              LoginForm(
                onPressed: _signInUser, // Pass the correct callback function
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: const Text(
                      "Create an account here",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final void Function(String, String) onPressed;
  const LoginForm({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text('Login your Account:',
                    style: TextStyle(
                        fontFamily: "AdobeDevanagari",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Email",
            icon: Icons.email,
            validator: validateEmail,
            textController: emailController,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Password",
            icon: Icons.password,
            obscureText: true,
            validator: validatePassword,
            textController: passwordController,
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              if (_loginFormKey.currentState!.validate()) {
                widget.onPressed(
                  emailController.text,
                  passwordController.text,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyHomePage(title: "iExplore")));
              }
            },
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
