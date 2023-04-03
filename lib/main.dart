import 'package:flutter/material.dart';

import 'style.dart';
import 'model.dart';
import 'task.dart';

void main() {
  runApp(CardApp());
}

class CardApp extends StatefulWidget {

  @override
  _CardAppState createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {

  @override
  Widget build(BuildContext context) {
    // Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Scaffold: the outer container that holds all the widgets
      home: Scaffold(
        backgroundColor: darkBackColor,
        // Container: the inner container
        body: SizedBox(
          width: double.infinity, // stretches the container to the width of the screen
          height: double.infinity, // same for the height
          // Padding: adds the padding around the card
          child: Padding(
            padding: padding,
            // Card: the literal card with rounded corners
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              color: backColor,
              // Padding: adds the padding inside the card so the tasks don't touch the edges
              child: Padding(
                padding: const EdgeInsets.all(25.0), // Add padding outside the card
                // Column to hold the collection of tasks
                child: Column(
                  // Collection of tasks
                  children: <Widget>[
                    for (var i = 0; i < tasks.length; i++)
                      Column(
                        children: [
                          TaskUi(
                            taskitem: tasks[i],
                          ),
                          const SizedBox(height: 14.0), // Adds spacing between each Task UI
                          // LOOK: Gap widget
                          // LOOK: List view builder / List view scroll widget
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Floating Button
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 20.0, right: 20.0), // Adds margin bottom and right
          child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: redColor,
            onPressed: () {
              setState(() {
                tasks.add(Task(text: 'New task'));
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
        ),
      ),
    );
  }
}
