import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.put(HomeController());
  // final TodoController todoController = Get.find();
final TodoController todoController = Get.find<TodoController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Obx(() {
        final todos = homeController.progressTodos;

        if (todos.isEmpty) {
          return const Center(child: Text('Homepage Kosong'));
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
                    color: homeController.getStatusColor(todo.status.value),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.ADD_TODO),
        child: const Icon(Icons.add),
      ),
    );
  }
}
