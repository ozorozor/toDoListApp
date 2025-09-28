import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/routes/app_routes.dart';

class ProfileController extends GetxController {
  /// Data profil (sementara hardcode, bisa juga dari API/DB)
  final Map<String, String> profile = const {
    'name': 'Ozora Aldestha',
    'kelas': '11 PPLG 1',
    'absen': '28 / 01',
    'photoUrl': 'https://example.com/photo.jpg',
  };

  /// Fungsi logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("username"); // hapus session login
    Get.offAllNamed(AppRoutes.splashscreen); // balik ke splash
  }
}
