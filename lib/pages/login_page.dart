import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/reusable/custom.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              textEditingController: loginController.usernameController,
              hintText: "Username",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              textEditingController: loginController.passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: "LOGIN",
              textColor: Colors.white,
              onPressed: () {
                loginController.login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
