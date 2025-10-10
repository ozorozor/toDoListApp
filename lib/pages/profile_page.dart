import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  void _showLogoutMessageBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('Konfirmasi Logout', style: TextStyle(color: Colors.white)),
        content: const Text('Apakah kamu yakin ingin logout?', style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();

              // Snackbar
              Get.snackbar(
                'Logout Berhasil',
                'Kamu sudah keluar dari aplikasi.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.grey[850],
                colorText: Colors.white,
                duration: const Duration(seconds: 2),
              );

              // Ganti route ke login
              Future.delayed(const Duration(seconds: 1), () {
                Get.offAllNamed('/login');
              });
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = {
      'name': 'Jemboets Developer',
      'kelas': 'XI RPL 2',
      'absen': 'No. 16',
    };

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _showLogoutMessageBox(context),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight * 0.8,
              maxWidth: screenWidth * 0.9,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: screenWidth * 0.18,
                    backgroundColor: Colors.grey[700],
                    child: Icon(
                      Icons.person,
                      size: screenWidth * 0.2,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        profile['name']!,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.school, color: Colors.white, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            profile['kelas']!,
                            style: const TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.confirmation_number, color: Colors.white, size: 18),
                          const SizedBox(width: 6),
                          Text(
                            profile['absen']!,
                            style: const TextStyle(fontSize: 14, color: Colors.white60),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
