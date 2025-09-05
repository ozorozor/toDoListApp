import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';

class TodoController extends GetxController {
  /// List utama todos
  var todos = <Todo>[].obs;

  /// Getter hanya ambil todos yg masih progress
  List<Todo> get progressTodos =>
      todos.where((todo) => todo.status.value == 'Progress').toList();

  /// Getter hanya ambil todos yg Complete atau Cancel
  List<Todo> get historyTodos =>
      todos.where((todo) => todo.status.value != 'Progress').toList();

  /// Tambah todo baru
  void addTodo(Todo todo) {
    todos.add(todo);
  }

  /// Update todo berdasarkan index
  void updateTodo(int index, Todo updatedTodo) {
    if (index >= 0 && index < todos.length) {
      todos[index].title = updatedTodo.title;
      todos[index].description = updatedTodo.description;
      todos[index].status.value = updatedTodo.status.value;
      todos.refresh();
    }
  }

  /// Hapus todo
  void deleteTodo(int index) {
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
    }
  }

  /// Ambil warna status (helper UI)
  Color getStatusColor(String status) {
    switch (status) {
      case 'Complete':
        return const Color.fromARGB(255, 0, 200, 0); // hijau
      case 'Cancel':
        return const Color.fromARGB(255, 200, 0, 0); // merah
      case 'Progress':
      default:
        return const Color.fromARGB(255, 255, 165, 0); // oranye
    }
  }
}
