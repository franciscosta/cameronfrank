import 'package:flutter/material.dart';
import 'style.dart';
import 'model.dart';

class TaskUi extends StatefulWidget {
  final Task taskitem;

  TaskUi({
    required this.taskitem,
  });

  @override
  _TaskUiState createState() => _TaskUiState(
        task: taskitem.text,
        isComplete: false,
        onToggleComplete: () {},
      );

}

class _TaskUiState extends State<TaskUi> {
  
  String task;
  bool isComplete;
  final VoidCallback onToggleComplete;

  _TaskUiState({
    required this.task,
    required this.isComplete,
    required this.onToggleComplete,
  });

  // This function returns the checkbox icon + behavior
  Widget _getCheckboxIcon() {

    if (isComplete) {
      return Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: greenBack,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Icon(Icons.done, size: 16.0, color: greenColor),
        ),
      );
      
    } else {
      return Container(
        width: 25.0,
        height: 25.0,
        decoration: BoxDecoration(
          color: const Color(0xFF312F40),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 16.0, color: Colors.white),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Padding: adds space around the task
    return Padding(
      padding: cardPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
        children: [
          Align(
            alignment: Alignment.topCenter, // Aligns the checkbox to the top
            child: InkWell(
              onTap: () {
                setState(() {
                  isComplete = !isComplete;
                  onToggleComplete();
                });
              },
              child: Container(
                width: 25.0,
                height: 25.0,
                decoration: BoxDecoration(
                  color: Color(0xFF312F40),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: _getCheckboxIcon(),
                ),
              ),
            ),
          ),
          // Separates the checkbox from the task
          const SizedBox(width: 10.0),
          // Expanded: makes the task text take up the remaining space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns metadata items to the left
              children: [
                // Task text
                Text(
                  task,
                  style: TextStyle(
                    fontFamily: 'Inter-Medium',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                    letterSpacing: 0.01,
                  ),
                ),
                const SizedBox(height: 5.0), // Add some space between task text and metadata items
                Row(
                  // Task metadata:
                  children: const [
                    SizedBox(height: 20.0),
                    Icon(Icons.schedule, size: 14.0, color: Colors.grey),
                    SizedBox(width: 5.0),
                    Text('10:00 AM', style: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Inter-Regular', fontWeight: FontWeight.w400)),
                    SizedBox(width: 10.0),
                    Icon(Icons.sort, size: 14.0, color: Colors.grey),
                    SizedBox(width: 5.0),
                    Text('Q2 Marketing', style: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Inter-Regular', fontWeight: FontWeight.w400)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
