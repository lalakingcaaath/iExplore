import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [orangeOneColor, orangeTwoColor, orangeThreeColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderSection(
                  imageSrc: 'images/iexplore-logo.png', logoTitle: 'iExplore'),
              SizedBox(
                height: 25,
              ),
              RegisterFormSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFormSection extends StatelessWidget {
  const RegisterFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Header
        Padding(
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
        SizedBox(
          height: 25,
        ),
        TextFieldComponent(name: "Name", icon: Icons.account_circle),
        SizedBox(
          height: 25,
        ),
        TextFieldComponent(name: "Email", icon: Icons.email),
        SizedBox(
          height: 25,
        ),
        TextFieldComponent(
          name: "Password",
          icon: Icons.password,
          obscureText: true,
        ),
        SizedBox(
          height: 25,
        ),
        TextFieldComponent(
          name: "Confirm Password",
          icon: Icons.password,
          obscureText: true,
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
