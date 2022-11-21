import 'package:flutter/material.dart';

import 'package:todoapp/todo_apitest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo_Json'),
        ),
        body: TodoApi(),
      ),
    );
  }
}
