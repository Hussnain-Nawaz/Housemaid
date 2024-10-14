class MessageModel {
  final String text; // Message content
  final String senderId; // ID of the sender
  final String timestamp; // Time the message was sent
  final String type; // 'text' or 'task'
  final TaskDetails? taskDetails; // Optional for task messages

  MessageModel({
    required this.text,
    required this.senderId,
    required this.timestamp,
    this.type = 'text',
    this.taskDetails,
  });

  // Factory method to create MessageModel from JSON (for API calls)
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'],
      senderId: json['senderId'],
      timestamp: json['timestamp'],
      type: json['type'] ?? 'text',
      taskDetails: json['taskDetails'] != null
          ? TaskDetails.fromJson(json['taskDetails'])
          : null,
    );
  }

  // Convert MessageModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'senderId': senderId,
      'timestamp': timestamp,
      'type': type,
      'taskDetails': taskDetails?.toJson(),
    };
  }
}

class TaskDetails {
  final Map<String, int> roomTasks; // Room name with number of tasks
  final String price; // Example: "$150"
  final String dateTime; // Example: "25 July 2024, 12:00 AM"
  final String location; // Example: "Street #, Area Name, City"

  TaskDetails({
    required this.roomTasks,
    required this.price,
    required this.dateTime,
    required this.location,
  });

  // Factory method to create TaskDetails from JSON
  factory TaskDetails.fromJson(Map<String, dynamic> json) {
    return TaskDetails(
      roomTasks: Map<String, int>.from(json['roomTasks']),
      price: json['price'],
      dateTime: json['dateTime'],
      location: json['location'],
    );
  }

  // Convert TaskDetails to JSON
  Map<String, dynamic> toJson() {
    return {
      'roomTasks': roomTasks,
      'price': price,
      'dateTime': dateTime,
      'location': location,
    };
  }
}
