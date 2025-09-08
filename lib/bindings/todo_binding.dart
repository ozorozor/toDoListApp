import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:get/get.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
