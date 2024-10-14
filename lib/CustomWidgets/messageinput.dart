import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {
  final Function(String) onSend;
  final TextEditingController _controller = TextEditingController();

  MessageInput({required this.onSend});

  void _handleSend() {
    if (_controller.text.trim().isNotEmpty) {
      onSend(_controller.text.trim());
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _handleSend,
          ),
        ],
      ),
    );
  }
}
