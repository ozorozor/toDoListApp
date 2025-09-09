import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  List<Todo> get progressTodos =>
      todos.where((todo) => todo.status.value == 'Progress').toList();

  List<Todo> get historyTodos =>
      todos.where((todo) => todo.status.value != 'Progress').toList();

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void updateTodo(int index, Todo updatedTodo) {
    if (index >= 0 && index < todos.length) {
      todos[index].title = updatedTodo.title;
      todos[index].description = updatedTodo.description;
      todos[index].status.value = updatedTodo.status.value;
      todos.refresh();
    }
  }

  void deleteTodo(int index) {
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
    }
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
