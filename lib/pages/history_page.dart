import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:flutter_application_1/models/todo.dart';
import '../routes/app_routes.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    Color getStatusColor(String status) {
      switch (status) {
        case 'Complete':
          return Colors.green;
        case 'Cancel':
          return Colors.red;
        case 'Progress':
        default:
          return Colors.orange;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: Obx(() {
        // Hanya ambil todos yang Complete
        final completedTodos = todoController.todos
            .where((todo) => todo.status.value == 'Complete')
            .toList();

        if (completedTodos.isEmpty) {
          return const Center(child: Text('No completed todos yet.'));
        }

        return ListView.builder(
          itemCount: completedTodos.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final todo = completedTodos[index];
            final originalIndex = todoController.todos.indexOf(todo);

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[800], // container abu-abu gelap
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
                    color: getStatusColor(todo.status.value),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // menuju ke EditTodoPage
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
