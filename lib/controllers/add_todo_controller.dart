import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';

class AddTodoController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descController = TextEditingController();

  var selectedStatus = 'Progress'.obs;
  final List<String> statuses = ['Progress', 'Complete', 'Cancel'];

  final TodoController todoController = Get.find();

  void submit() {
    if (formKey.currentState!.validate()) {
      final newTodo = Todo(
        title: titleController.text.trim(),
        description: descController.text.trim(),
        status: selectedStatus.value,
      );
      todoController.addTodo(newTodo);
      Get.back();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
