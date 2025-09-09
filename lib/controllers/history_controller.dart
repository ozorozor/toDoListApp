import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:flutter_application_1/models/todo.dart';

class HistoryController extends GetxController {
  final TodoController todoController = Get.find();

  List<Todo> get historyTodos {
    final todos = todoController.todos
        .where((todo) => todo.status.value != 'Progress')
        .toList();

    todos.sort((a, b) {
      int getPriority(String status) {
        if (status == 'Complete') return 0;
        if (status == 'Cancel') return 1;
        return 2;
      }

      return getPriority(a.status.value)
          .compareTo(getPriority(b.status.value));
    });

    return todos;
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Complete':
        return const Color.fromARGB(255, 0, 200, 0);
      case 'Cancel':
        return const Color.fromARGB(255, 200, 0, 0);
      case 'Progress':
      default:
        return const Color.fromARGB(255, 255, 165, 0);
    }
  }
}
