import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class LoginController extends GetxController {
  /// TextEditingController untuk username & password
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  /// Observable untuk toggle password
  var obscurePassword = true.obs;

  /// Fungsi login
  void login(BuildContext context) {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username == 'admin' && password == '123') {
      Get.offAllNamed(AppRoutes.DASHBOARD);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah')),
      );
    }
  }

  /// Jangan lupa dispose controller saat tidak dipakai
  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
