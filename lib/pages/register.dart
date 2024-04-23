import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/components/HeaderComponent.dart';
import 'package:i_explore/services/AuthService.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:i_explore/components/TextFieldComponent.dart';
import 'package:i_explore/utils/validator.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  final _registerFormKey = GlobalKey<FormState>();

  void _createUser(BuildContext context) async {
    if (_registerFormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
    }
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String conPassword = _confirmPasswordController.text.trim();

    try {
      AuthService authService =
          Provider.of<AuthService>(context, listen: false);
      final user =
          await authService.registerUser(name, email, password, conPassword);
      print(user);
      if (user != null) {
        // Navigate to home page after successful authentication
        context.go('/home');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to register: ${e.toString()}'),
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

  @override 
  void dispose() { 
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
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
            textController: _nameController,
            validator: validateName,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Email",
            icon: Icons.email,
            textController: _emailController,
            validator: validateEmail,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Password",
            icon: Icons.password,
            obscureText: true,
            textController: _passwordController,
            validator: validatePassword,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldComponent(
            name: "Confirm Password",
            icon: Icons.password,
            obscureText: true,
            textController: _confirmPasswordController,
            validator: (value) =>
                validateConfirmPassword(value, _passwordController.text),
          ),
          const SizedBox(
            height: 25,
          ),
          _isLoading
              ? CircularProgressIndicator()
              : GestureDetector(
                  onTap: () => _createUser(context),
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
