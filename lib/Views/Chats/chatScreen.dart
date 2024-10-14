import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_maid_project/Controllers/chatcontrol.dart';
import 'package:house_maid_project/CustomWidgets/taskCard.dart';

class ChatScreen extends StatelessWidget {
  final String chatId;
  final String currentUserId;
  final bool isHousemaid; // Indicates the user role
  final String recipientName;
  final String recipientAvatar;

  final ChatController chatController = Get.find();

  ChatScreen({
    required this.chatId,
    required this.currentUserId,
    required this.isHousemaid, // Flag to indicate role
    required this.recipientName,
    required this.recipientAvatar,
  });

  @override
  Widget build(BuildContext context) {
    chatController.loadChatHistory(
        chatId, isHousemaid); // Load role-based history

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profileimage.jpg'),
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          recipientName,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final chatMessages = chatController.messages[chatId] ?? [];
              if (chatMessages.isEmpty) {
                return Center(child: Text('No messages yet.'));
              }
              return ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final message = chatMessages[index];

                  if (message.type == 'task' && message.taskDetails != null) {
                    return TaskCard(
                        taskDetails: message.taskDetails!); // Render TaskCard
                  }

                  final isOwnMessage = message.senderId == currentUserId;
                  return Align(
                    alignment: isOwnMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                            isOwnMessage ? Colors.pink[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          _buildMessageInput(),
          SizedBox(
            height: 20,
          ) // Message input field
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    final TextEditingController _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send,
                color: const Color.fromARGB(255, 247, 88, 141)),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                chatController.sendMessage(
                  _controller.text,
                  chatId,
                  currentUserId,
                );
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
