import 'package:flutter_application_1/controllers/add_todo_controller.dart';
import 'package:get/get.dart';

class AddTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(() => AddTodoController());
  }
}
