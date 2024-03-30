import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:i_explore/components/TextFieldComponent.dart';
import 'package:i_explore/utils/validator.dart';

Color orangeOneColor = const Color(0xFFD25017);
Color orangeTwoColor = const Color(0xFFDD6614);
Color orangeThreeColor = const Color(0xFFE0750F);
Color brownColor = const Color(0xFF703A07);

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      print('User signed up: ${user!.uid}');
    } catch (e) {
      print('Failed to sign up: $e');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  // final void Function(String, String) onPressed;

  const RegisterForm({
    Key? key,
    // required this.onPressed,
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
            onTap: () {
              if (_formKey.currentState!.validate()) {
                
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
