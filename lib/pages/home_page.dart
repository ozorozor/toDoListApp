import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/pages/add_todo_pages.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(child: Text('Homepage Kosong'));
        }

        // SORTING di luar ListView, langsung saat data diambil
        final sortedTodos = [...todoController.todos];
        sortedTodos.sort((a, b) {
          int getPriority(String status) {
            if (status == 'Progress') return 0;
            if (status == 'Complete') return 1;
            if (status == 'Cancel') return 2;
            return 3;
          }

          return getPriority(a.status.value).compareTo(getPriority(b.status.value));
        });

        return ListView.builder(
          itemCount: sortedTodos.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final todo = sortedTodos[index]; 

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
                    color: getStatusColor(todo.status.value),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  final originalIndex = todoController.todos.indexOf(todo);
                  Get.toNamed(AppRoutes.EDIT_TODO, arguments: {
                    'index': originalIndex,
                    'todo': todo,
                  });
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.ADD_TODO),
        child: const Icon(Icons.add),
      ),
    );
  }

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
}
