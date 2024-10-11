import 'package:flutter/material.dart';

class CustomNextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomNextButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 383,
      height: 62,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color(0xFFFEB0D9), // Background color: var(--P, #FEB0D9)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31), // Border radius: 31px
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
