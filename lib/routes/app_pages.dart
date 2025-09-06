import 'package:get/get.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/dashboard_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/add_todo_pages.dart';
import 'package:flutter_application_1/pages/edit_todo_page.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
GetPage(name: AppRoutes.LOGIN, page: () => const LoginPage()),

    GetPage(name: AppRoutes.DASHBOARD, page: () => const DashboardPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(name: AppRoutes.ADD_TODO, page: () => const AddTodoPage()),
    GetPage(
      name: AppRoutes.EDIT_TODO,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return EditTodoPage(
          index: args['index'],
          todo: args['todo'] as Todo,
        );
      },
    ),
  ];
}
