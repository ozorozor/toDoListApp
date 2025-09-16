import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';

class EditTodoController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descController;

  var selectedStatus = 'Progress'.obs;
  final List<String> statuses = ['Progress', 'Complete', 'Cancel'];

  final TodoController todoController = Get.find();

  late int index;

  void initData({required int index, required Todo todo}) {
    this.index = index;
    titleController = TextEditingController(text: todo.title);
    descController = TextEditingController(text: todo.description);
    selectedStatus.value = todo.status.value;
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      final updatedTodo = Todo(
        title: titleController.text.trim(),
        description: descController.text.trim(),
        status: selectedStatus.value,
      );
      todoController.updateTodo(index, updatedTodo);
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
