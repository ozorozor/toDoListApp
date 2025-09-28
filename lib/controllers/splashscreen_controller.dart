import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin() async {
    await Future.delayed(Duration(seconds: 5));
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString("username");
    if (savedUsername != null) {
      Get.offAllNamed(AppRoutes.DASHBOARD);
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }
}