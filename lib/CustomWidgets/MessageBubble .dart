import 'package:flutter/material.dart';
import 'package:house_maid_project/AModels/chatModel.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool isOwnMessage;

  MessageBubble({required this.message, required this.isOwnMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOwnMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isOwnMessage ? Colors.pink[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              message.timestamp,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
