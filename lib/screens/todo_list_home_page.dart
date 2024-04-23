import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:todo_list/utils/colors.dart';
import 'add_task_dialog.dart';
import '../models/task.dart';

class TodoListHomePage extends StatefulWidget {
  const TodoListHomePage({super.key});

  @override
  _TodoListHomePageState createState() => _TodoListHomePageState();
}

class _TodoListHomePageState extends State<TodoListHomePage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0, // Remove default card elevation
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Set card border radius
              side: BorderSide(
                  color:
                      Colors.grey[300]!), // Set card border color to light grey
            ),
            child: ListTile(
              leading: InkWell(
                onTap: () {
                  setState(() {
                    tasks[index].isDone = !tasks[index].isDone;
                  });
                },
                child: Icon(
                  tasks[index].isDone
                      ? Icons.circle_rounded
                      : Icons.circle_outlined,
                  color: tasks[index].isDone
                      ? AppColors.taskDone
                      : AppColors.taskBorder,
                ),
              ),
              title: Text(tasks[index].text),
              subtitle: Text(DateFormat('yyyy-MM-dd')
                  .format(tasks[index].date)), // Format the date without time
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: () {
                  _deleteTask(index);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog();
        },
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTaskDialog(
          onTaskAdded: (task) {
            setState(() {
              tasks.add(task);
            });
          },
        );
      },
    );
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
}
