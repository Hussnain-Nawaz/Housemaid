import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomPasswordField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _isObscure = true; // By default, password is hidden

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 383, // Adapt this to your layout
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(31.5), // Rounded corners
        border: Border.all(color: const Color(0xFFDEDEDE)), // Border color
        color: const Color(0xFFFAFAFA), // Background color
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: _isObscure, // Handle password visibility
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure; // Toggle visibility
              });
            },
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Urbanist',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
    );
  }
}
