import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';

class AddTodoController extends GetxController {
  // Form key untuk validasi
  final formKey = GlobalKey<FormState>();

  // Controller input
  final titleController = TextEditingController();
  final descController = TextEditingController();

  // Status dropdown
  var selectedStatus = 'Progress'.obs;
  final List<String> statuses = ['Progress', 'Complete', 'Cancel'];

  // Reference ke TodoController utama
  final TodoController todoController = Get.find();

  // Fungsi submit
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
    // Hapus controller ketika page ditutup
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
