import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/history_controller.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import '../routes/app_routes.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
final TodoController todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: Obx(() {
        final todos = todoController.historyTodos;

        if (todos.isEmpty) {
          return const Center(child: Text('History Kosong'));
        }

        return ListView.builder(
          itemCount: todos.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final todo = todos[index];
            final originalIndex = todoController.todos.indexOf(todo);

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  todo.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(todo.description),
                trailing: Text(
                  todo.status.value,
                  style: TextStyle(
                    color: todoController.getStatusColor(todo.status.value),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Get.toNamed(
                    AppRoutes.EDIT_TODO,
                    arguments: {
                      'index': originalIndex,
                      'todo': todo,
                    },
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
