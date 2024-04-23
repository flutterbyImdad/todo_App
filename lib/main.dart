import 'package:flutter/material.dart';
import 'package:todo_list/screens/todo_list_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListHomePage(),
      debugShowCheckedModeBanner: false, // Set to false to remove debug banner
    );
  }
}
