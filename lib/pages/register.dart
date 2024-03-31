import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/components/TextFieldComponent.dart';
import 'package:i_explore/utils/validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPasswordController =
  //     TextEditingController();

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      // show progress indication
      showDialog(
          context: context,
          builder: (context) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(orangeTwoColor),
            ));
          });
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      print('User signed up: ${user!.uid}');
      // remove the progress indicator
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          // scaffold
          if (mounted) {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text('Failed to create user: $e'),
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
        case 'email-already-in-use':
          if (mounted) {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text('Failed to create user: $e'),
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
              content: Text('Failed to create user: $e'),
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
      )),
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
              RegisterForm(
                onPressed: createUserWithEmailAndPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final void Function(String, String) onPressed;

  const RegisterForm({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text('Create your Account:',
                    style: TextStyle(
                        fontFamily: "AdobeDevanagari",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ],
            ),
          ),
          // Form Text Field
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Name",
            icon: Icons.account_circle,
            textController: nameController,
            validator: validateName,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Email",
            icon: Icons.email,
            textController: emailController,
            validator: validateEmail,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Password",
            icon: Icons.password,
            obscureText: true,
            textController: passwordController,
            validator: validatePassword,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Confirm Password",
            icon: Icons.password,
            obscureText: true,
            textController: confirmPasswordController,
            validator: (value) =>
                validateConfirmPassword(value, passwordController.text),
          ),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                // Show loading indicator while creating user
                try {
                  widget.onPressed(
                    emailController.text,
                    passwordController.text,
                  );
                  // Hide loading indicator after user creation is completed
                } catch (e) {
                  // Hide loading indicator and show error message if user creation fails
                }
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
                  "Sign Up",
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

// Header Section
class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.imageSrc,
    required this.logoTitle,
  });

  final String imageSrc;
  final String logoTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            imageSrc,
            width: 64,
            height: 64,
          ),
          Text(
            logoTitle,
            style: const TextStyle(
                fontFamily: 'AdobeDevanagari',
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.white),
          ),
          const SizedBox(
            width: 64,
          ),
        ],
      ),
    );
  }
}
