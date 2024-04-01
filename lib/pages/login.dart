import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_explore/components/HeaderComponent.dart';
import 'package:i_explore/components/TextFieldComponent.dart';
import 'package:i_explore/pages/register.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/utils/validator.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> signInUser(String email, String password) async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(orangeTwoColor),
            ));
          });

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          if (mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text(
                      'Failed to login: No user found for that email.'),
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
          break;
        case 'wrong-password':
          if (mounted) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Failed to login: Wrong Password'),
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
          break;
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Failed to login'),
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
                  imageSrc: 'images/iexplore-logo.png', logoTitle: 'iExplore'),
              const SizedBox(
                height: 25,
              ),
              LoginForm(
                onPressed: signInUser,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Have a account?",
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
                              builder: (context) => const Register()));
                    },
                    child: const Text(
                      "Create a account here",
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
          )),
        ));
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
