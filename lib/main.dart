import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/todo_contoller.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/routes/app_pages.dart';

void main() {
  Get.put(TodoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Warna dasar hitam-putih elegan
  static const Color darkBackground = Colors.black; // background utama
  static const Color inputBackground = Color(0xFF1E1E1E); // abu gelap untuk input
  static const Color primaryColor = Colors.white; // putih sebagai warna utama
  static const Color lightText = Colors.white; // teks putih

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ToDo List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBackground,
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.grey,
          surface: Color(0xFF1E1E1E),
          onPrimary: Colors.black, // teks di atas tombol putih
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
        textTheme: ThemeData.dark().textTheme.apply(
              bodyColor: lightText,
              displayColor: lightText,
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: inputBackground,
          hintStyle: TextStyle(color: lightText.withOpacity(0.6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: lightText,
          suffixIconColor: lightText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1.1,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      initialRoute: AppRoutes.splashscreen,
      getPages: AppPages.routes,
    );
  }
}
