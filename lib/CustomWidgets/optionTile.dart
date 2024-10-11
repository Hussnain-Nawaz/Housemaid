import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String optionText;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionTile({
    super.key,
    required this.optionText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color:
                isSelected ? const Color(0xFFFEB0D9) : const Color(0xFFDEDEDE),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? const Color(0xFFFEB0D9) : Colors.black,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.radio_button_checked,
                color: Color(0xFFFEB0D9),
              )
            else
              const Icon(
                Icons.radio_button_unchecked,
                color: Color(0xFFDEDEDE),
              ),
          ],
        ),
      ),
    );
  }
}
