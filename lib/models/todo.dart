import 'package:get/get.dart';

class Todo {
  String title;
  String description;
  String category;
  RxString status; // observable status

  Todo({
    required this.title,
    required this.description,
    required this.category,
    String status = 'Progress',
  }) : status = status.obs;
}
