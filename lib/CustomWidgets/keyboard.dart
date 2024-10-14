import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onTextInput;
  final VoidCallback onBackspace;

  const CustomKeyboard({
    Key? key,
    required this.onTextInput,
    required this.onBackspace,
  }) : super(key: key);

  void _textInputHandler(String text) => onTextInput(text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color:
          const Color.fromARGB(255, 237, 162, 201), // Set background color here
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 9) {
            return const SizedBox.shrink(); // Empty space
          } else if (index == 10) {
            return _buildKey("0");
          } else if (index == 11) {
            return _buildBackspaceKey();
          } else {
            return _buildKey((index + 1).toString());
          }
        },
      ),
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () => _textInputHandler(value),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // Key background color
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceKey() {
    return GestureDetector(
      onTap: onBackspace,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // Backspace key background color
        ),
        child: const Center(
          child: Icon(Icons.backspace, size: 20),
        ),
      ),
    );
  }
}
