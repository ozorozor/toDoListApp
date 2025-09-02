import 'package:get/get.dart';

class Todo {
  String title;
  String description;
  RxString status;

  Todo({
    required this.title,
    required this.description,
    required String status,
  }) : status = status.obs;
}
