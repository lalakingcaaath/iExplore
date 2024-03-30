// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool obscureText;
  final TextEditingController textController;
  final String? Function(String?)? validator;

  const TextFieldComponent({
    Key? key,
    required this.name,
    required this.icon,
    required this.textController,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: textController,
        validator: validator,
        enabled: true,
        obscureText: obscureText,
        maxLength: 32,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: name,
          prefixIcon: Icon(icon),
          counterText: "",
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
