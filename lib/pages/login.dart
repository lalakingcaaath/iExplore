import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/HeaderComponent.dart';
import 'package:i_explore/components/TextFieldComponent.dart';
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
              LoginForm(),
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
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _signInUser(BuildContext context) async {
    if (_loginFormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Set loading state to true while signing in
      });
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      try {
        AuthService authService =
            Provider.of<AuthService>(context, listen: false);
        final user = await authService.signInUser(email, password);
        print('user: ${user}');
        if (user != null) {
          // Navigate to home page after successful authentication
          context.go('/home');
        }
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
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
            textController: _emailController,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Password",
            icon: Icons.password,
            obscureText: true,
            validator: validatePassword,
            textController: _passwordController,
          ),
          const SizedBox(
            height: 25,
          ),
          _isLoading
              ? CircularProgressIndicator()
              : GestureDetector(
                  onTap: () => _signInUser(context),
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
