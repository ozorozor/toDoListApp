import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';

class EditTodoController extends GetxController {
  // Form key
  final formKey = GlobalKey<FormState>();

  // Controller input
  late TextEditingController titleController;
  late TextEditingController descController;

  // Status dropdown
  var selectedStatus = 'Progress'.obs;
  final List<String> statuses = ['Progress', 'Complete', 'Cancel'];

  // Reference ke TodoController utama
  final TodoController todoController = Get.find();

  // Index todo yang diedit
  late int index;

  // Inisialisasi dengan data todo
  void initData({required int index, required Todo todo}) {
    this.index = index;
    titleController = TextEditingController(text: todo.title);
    descController = TextEditingController(text: todo.description);
    selectedStatus.value = todo.status.value;
  }

  // Fungsi submit / update
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
    // Dispose controller
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
