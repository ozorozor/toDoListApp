import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/history_controller.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:flutter_application_1/controllers/example_controller.dart';
import '../routes/app_routes.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final HistoryController historyController = Get.put(HistoryController());
  final TodoController todoController = Get.find<TodoController>();
  final ExampleController controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);

          return Obx(() => controller.isMobile.value
              ? _buildMobileLayout(context)
              : _buildWidescreenLayout(context));
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History (Mobile)')),
      body: Obx(() {
        final todos = todoController.historyTodos;

        if (todos.isEmpty) {
          return const Center(
            child: Text(
              'History Kosong',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          );
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
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  todo.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  todo.description,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  todo.status.value,
                  style: TextStyle(
                    color:
                        historyController.getStatusColor(todo.status.value),
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
      backgroundColor: Colors.black,
    );
  }

  Widget _buildWidescreenLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History (Widescreen)')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final todos = todoController.historyTodos;

            if (todos.isEmpty) {
              return const Center(
                child: Text(
                  'History Kosong',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3,
              ),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                final originalIndex = todoController.todos.indexOf(todo);

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.EDIT_TODO,
                        arguments: {
                          'index': originalIndex,
                          'todo': todo,
                        },
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            todo.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            todo.status.value,
                            style: TextStyle(
                              color: historyController
                                  .getStatusColor(todo.status.value),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
