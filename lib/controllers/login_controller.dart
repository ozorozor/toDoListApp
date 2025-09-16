import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var obscurePassword = true.obs;

  void login(BuildContext context) {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username == 'ozora' && password == 'nendra') {
      Get.offAllNamed(AppRoutes.DASHBOARD);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah')),
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
