import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/pages/add_todo_pages.dart';

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
          return const Center(child: Text('No todos yet.'));
        }

        return ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              trailing: Text(
                todo.status.value,
                style: TextStyle(
                  color: getStatusColor(todo.status.value),
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddTodoPage()),
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
