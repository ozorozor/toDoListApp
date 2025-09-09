import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/edit_todo_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/reusable/reusable_widgets.dart';

class EditTodoPage extends StatefulWidget {
  final int index;
  final dynamic todo;

  const EditTodoPage({super.key, required this.index, required this.todo});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final EditTodoController controller = Get.find<EditTodoController>();
  @override
  void initState() {
    super.initState();
    controller.initData(index: widget.index, todo: widget.todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Todo')),
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
                text: 'Update Todo',
                onPressed: controller.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
