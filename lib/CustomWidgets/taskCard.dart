import 'package:flutter/material.dart';
import 'package:house_maid_project/AModels/chatModel.dart';

class TaskCard extends StatelessWidget {
  final TaskDetails taskDetails;

  TaskCard({required this.taskDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Task Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 10),
          ...taskDetails.roomTasks.entries.map((entry) {
            return Text('${entry.key}: ${entry.value} tasks');
          }).toList(),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.monetization_on),
              SizedBox(width: 5),
              Text('Price: ${taskDetails.price}'),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.calendar_today),
              SizedBox(width: 5),
              Text(taskDetails.dateTime),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 5),
              Expanded(child: Text(taskDetails.location)),
            ],
          ),
        ],
      ),
    );
  }
}
