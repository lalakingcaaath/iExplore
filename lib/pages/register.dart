import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_explore/components/TextFieldComponent.dart';

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
              RegisterFormSection(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFormSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterFormSection({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        const SizedBox(
          height: 25,
        ),
        TextFieldComponent(
          name: "Email",
          icon: Icons.email,
          textController: emailController,
        ),
        const SizedBox(
          height: 25,
        ),
        TextFieldComponent(
          name: "Password",
          icon: Icons.password,
          obscureText: true,
          textController: passwordController,
        ),
        const SizedBox(
          height: 25,
        ),
        TextFieldComponent(
          name: "Confirm Password",
          icon: Icons.password,
          obscureText: true,
          textController: confirmPasswordController,
        ),
      ],
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
