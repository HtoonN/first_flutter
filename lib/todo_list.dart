import 'package:flutter/material.dart';
import 'package:my_project/todo_router.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: todoRouter,
    );
  }
}
