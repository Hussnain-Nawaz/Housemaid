import 'package:get/get.dart';
import 'package:house_maid_project/AModels/chatModel.dart';

class ChatController extends GetxController {
  var chats = <Map<String, dynamic>>[
    {
      'chatId': '1',
      'name': 'Client Name',
      'avatar': 'https://via.placeholder.com/150',
      'lastMessage': 'Sent a task...',
      'lastMessageTime': '14:28',
      'unreadCount': 1,
    },
  ].obs;

  var messages = <String, List<MessageModel>>{}.obs;

  // Load chat history (simulate data for housemaid or client)
  Future<void> loadChatHistory(String chatId, bool isHousemaid) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    if (messages[chatId] == null) {
      if (isHousemaid) {
        // If housemaid, load received messages
        messages[chatId] = [
          MessageModel(
            text: 'Hi, please take care of these tasks.',
            senderId: '1', // Client's ID
            timestamp: '14:22',
            type: 'text',
          ),
          MessageModel(
            text: 'New Task Assigned',
            senderId: '1', // Client's ID
            timestamp: '14:25',
            type: 'task',
            taskDetails: TaskDetails(
              roomTasks: {'Bathroom': 5, 'Kitchen': 3, 'Dining Room': 2},
              price: '\$150',
              dateTime: '25 July 2024, 12:00 AM',
              location: 'Street #, Area Name, City, Country',
            ),
          ),
        ];
      } else {
        // If client, load sent messages
        messages[chatId] = [
          MessageModel(
            text: 'Hi, how is the task going?',
            senderId: '2', // Client's ID
            timestamp: '14:22',
            type: 'text',
          ),
        ];
      }
    }
    messages.refresh(); // Refresh UI
  }

  // Send a text message
  void sendMessage(String text, String chatId, String senderId) {
    final newMessage = MessageModel(
      text: text,
      senderId: senderId,
      timestamp: DateTime.now().toString().substring(11, 16),
      type: 'text',
    );
    _addMessageToChat(chatId, newMessage);
    updateChatList(chatId, text);
  }

  // Send a task message (only by client)
  void sendTaskMessage(
      String chatId, String senderId, TaskDetails taskDetails) {
    final taskMessage = MessageModel(
      text: 'Task Assigned',
      senderId: senderId,
      timestamp: DateTime.now().toString().substring(11, 16),
      type: 'task',
      taskDetails: taskDetails,
    );
    _addMessageToChat(chatId, taskMessage);
    updateChatList(chatId, 'New Task Assigned');
  }

  // Add a message to chat and refresh UI
  void _addMessageToChat(String chatId, MessageModel message) {
    if (messages[chatId] == null) {
      messages[chatId] = [];
    }
    messages[chatId]!.add(message);
    messages.refresh();
  }

  // Update chat list with the latest message
  void updateChatList(String chatId, String lastMessage) {
    final chat = chats.firstWhere((chat) => chat['chatId'] == chatId);
    chat['lastMessage'] = lastMessage;
    chat['lastMessageTime'] = DateTime.now().toString().substring(11, 16);
    chats.refresh();
  }

  // Reset unread message count for a specific chat
  void resetUnreadCount(String chatId) {
    final chat = chats.firstWhere((chat) => chat['chatId'] == chatId);
    chat['unreadCount'] = 0; // Reset unread count to zero
    chats.refresh(); // Refresh UI
  }
}


// import 'package:chat_module/Models/chatModel.dart';
// import 'package:get/get.dart';

// class ChatController extends GetxController {
//   var chats = <Map<String, dynamic>>[
//     {
//       'chatId': '1',
//       'name': 'Iheme',
//       'avatar': 'https://via.placeholder.com/150',
//       'lastMessage': 'Iheme is typing...',
//       'lastMessageTime': '14:28',
//       'unreadCount': 1,
//     },
//   ].obs;

//   var messages = <String, List<MessageModel>>{}.obs;

//   // Send a text message
//   void sendMessage(String text, String chatId, String senderId) {
//     final newMessage = MessageModel(
//       text: text,
//       senderId: senderId,
//       timestamp: DateTime.now().toString().substring(11, 16),
//       type: 'text',
//     );

//     _addMessageToChat(chatId, newMessage);
//     updateChatList(chatId, text);
//   }

//   // Send a task message
//   void sendTaskMessage(
//       String chatId, String senderId, TaskDetails taskDetails) {
//     final taskMessage = MessageModel(
//       text: 'Task received',
//       senderId: senderId,
//       timestamp: DateTime.now().toString().substring(11, 16),
//       type: 'task',
//       taskDetails: taskDetails,
//     );

//     _addMessageToChat(chatId, taskMessage);
//     updateChatList(chatId, 'New task received');
//   }

//   // Add a message to the chat and refresh the UI
//   void _addMessageToChat(String chatId, MessageModel message) {
//     if (messages[chatId] == null) {
//       messages[chatId] = [];
//     }
//     messages[chatId]!.add(message);
//     messages.refresh();
//   }

//   // Load chat history with simulated data (replace with API later)
//   Future<void> loadChatHistory(String chatId) async {
//     await Future.delayed(Duration(seconds: 1)); // Simulate network delay

//     if (messages[chatId] == null) {
//       messages[chatId] = [
//         MessageModel(
//           text: 'Hi, how are you?',
//           senderId: '2',
//           timestamp: '14:22',
//           type: 'text',
//         ),
//         MessageModel(
//           text: 'Task received',
//           senderId: '1',
//           timestamp: '14:25',
//           type: 'task',
//           taskDetails: TaskDetails(
//             roomTasks: {'Bathroom': 5, 'Kitchen': 3, 'Dining Room': 2},
//             price: '\$150',
//             dateTime: '25 July 2024, 12:00 AM',
//             location: 'Street #, Area Name, City, Country',
//           ),
//         ),
//       ];
//     }

//     messages.refresh();
//   }

//   // Reset unread message count for a chat
//   void resetUnreadCount(String chatId) {
//     final chat = chats.firstWhere((chat) => chat['chatId'] == chatId);
//     chat['unreadCount'] = 0;
//     chats.refresh();
//   }

//   // Update chat list with the latest message and time
//   void updateChatList(String chatId, String lastMessage) {
//     final chat = chats.firstWhere((chat) => chat['chatId'] == chatId);
//     chat['lastMessage'] = lastMessage;
//     chat['lastMessageTime'] = DateTime.now().toString().substring(11, 16);
//     chats.refresh();
//   }
// }
