import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void updateTodo(int index, Todo updatedTodo) {
    if (index >= 0 && index < todos.length) {
      todos[index] = updatedTodo;
    }
  }

  void deleteTodo(int index) {
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
    }
  }
}
