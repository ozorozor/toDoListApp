import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void updateStatus(int index, String newStatus) {
    todos[index].status.value = newStatus;
  }

  void removeTodo(int index) {
    todos.removeAt(index);
  }
}
