import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo.dart';

class TodoItemCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onTap;

  const TodoItemCard({super.key, required this.todo, this.onTap});

  Color getStatusColor(String status) {
    switch (status) {
      case 'Complete':
        return Colors.green;
      case 'Cancel':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(todo.description),
        trailing: Text(
          todo.status.value,
          style: TextStyle(
            color: getStatusColor(todo.status.value),
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
