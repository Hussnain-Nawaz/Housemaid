import 'package:house_maid_project/Controllers/chatcontrol.dart';
import 'chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final String currentUserId; // The logged-in user (client/housemaid)
  final bool isHousemaid; // Determine if the user is a housemaid

  ChatListScreen({
    required this.currentUserId,
    required this.isHousemaid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (chatController.chats.isEmpty) {
          return Center(
            child: Text('No chats available'),
          );
        }

        return ListView.builder(
          itemCount: chatController.chats.length,
          itemBuilder: (context, index) {
            final chat = chatController.chats[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profileimage.jpg'),
              ),
              title: Text(
                chat['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                chat['lastMessage'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chat['lastMessageTime'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  if (chat['unreadCount'] > 0) SizedBox(height: 5),
                  if (chat['unreadCount'] > 0)
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat['unreadCount'].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                ],
              ),
              onTap: () {
                // Reset unread messages when chat is opened
                chatController.resetUnreadCount(chat['chatId']);

                // Navigate to ChatScreen with the appropriate role
                Get.to(() => ChatScreen(
                      chatId: chat['chatId'],
                      currentUserId: currentUserId,
                      isHousemaid: isHousemaid,
                      recipientName: chat['name'],
                      recipientAvatar: chat['avatar'],
                    ));
              },
            );
          },
        );
      }),
    );
  }
}
