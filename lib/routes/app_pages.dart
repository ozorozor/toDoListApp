import 'package:flutter_application_1/bindings/add_todo_binding.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/dashboard_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/add_todo_pages.dart';
import 'package:flutter_application_1/pages/edit_todo_page.dart';
import 'package:flutter_application_1/pages/history_page.dart';
import 'package:flutter_application_1/models/todo.dart';

import 'app_routes.dart';
import 'package:flutter_application_1/bindings/todo_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashboardPage(),
    ),

    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: TodoBinding(),
    ),

    GetPage(
      name: AppRoutes.ADD_TODO,
      page: () => const AddTodoPage(),
      binding: AddTodoBinding(),
    ),

    GetPage(
      name: AppRoutes.HISTORY,
      page: () => const HistoryPage(),
      binding: TodoBinding(),
    ),

    GetPage(
      name: AppRoutes.EDIT_TODO,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return EditTodoPage(
          index: args['index'],
          todo: args['todo'] as Todo,
        );
      },
      binding: TodoBinding(),
    ),
  ];
}
