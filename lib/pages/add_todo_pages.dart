import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/add_todo_controller.dart';
import 'package:flutter_application_1/reusable/reusable_widgets.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  final AddTodoController controller = Get.find<AddTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter title' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.descController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter description' : null,
              ),
              const SizedBox(height: 16),
              Obx(() => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Status'),
                    value: controller.selectedStatus.value,
                    items: controller.statuses
                        .map((status) =>
                            DropdownMenuItem(value: status, child: Text(status)))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) controller.selectedStatus.value = val;
                    },
                  )),
              const SizedBox(height: 32),
              ReusableButton(
                text: 'Save Todo',
                onPressed: controller.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
