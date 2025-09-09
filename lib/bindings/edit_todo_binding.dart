import 'package:flutter_application_1/controllers/edit_todo_controller.dart';
import 'package:get/get.dart';

class EditTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTodoController>(() => EditTodoController());
  }
}
