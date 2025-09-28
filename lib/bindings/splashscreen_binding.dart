import 'package:flutter_application_1/controllers/splashscreen_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
//     Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }

}