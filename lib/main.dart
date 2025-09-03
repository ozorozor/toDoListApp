import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/dashboard_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/add_todo_pages.dart';
import 'package:flutter_application_1/pages/edit_todo_page.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/models/todo.dart';

void main() {
  Get.put(TodoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color darkBackground = Color(0xFF141111);
  static const Color inputBackground = Color(0xFF342E2E);
  static const Color primaryColor = Color(0xFF780817);
  static const Color lightText = Color(0xFFFEDDED);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBackground,
        primaryColor: primaryColor,
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          background: darkBackground,
          surface: inputBackground,
          onPrimary: lightText,
          onBackground: lightText,
          onSurface: lightText,
        ),
        textTheme: ThemeData.dark().textTheme.apply(
              bodyColor: lightText,
              displayColor: lightText,
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: inputBackground,
          hintStyle: TextStyle(color: lightText.withOpacity(0.7)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: lightText,
          suffixIconColor: lightText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 219, 223),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: lightText),
      ),

      initialRoute: AppRoutes.LOGIN,
      getPages: [
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
      ],
    );
  }
}
