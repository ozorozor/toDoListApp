import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
<<<<<<< HEAD
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login() async {
    if (usernameController.text.toString() == "admin" &&
        passwordController.text.toString() == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
=======
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var obscurePassword = true.obs;

  void login(BuildContext context) {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username == 'ozora' && password == 'nendra') {
>>>>>>> d766e254b2a4d10722ceca5242a64f9f1434e80d
      Get.offAllNamed(AppRoutes.DASHBOARD);
    } else {
      Get.snackbar("error", "incorrect username or password");
    }
  }
<<<<<<< HEAD
}
=======

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
>>>>>>> d766e254b2a4d10722ceca5242a64f9f1434e80d
