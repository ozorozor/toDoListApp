import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/example_controller.dart';
import 'package:flutter_application_1/controllers/login_controller.dart';
import 'package:flutter_application_1/reusable/custom.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final loginController = Get.find<LoginController>();
  final layoutController = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          layoutController.updateLayout(constraints);

          return Obx(() => layoutController.isMobile.value
              ? _buildMobileLayout()
              : _buildWideLayout());
        },
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            const Text(
              "Login Page",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
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

  Widget _buildWideLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Color(0xFF141111),
            child: const Center(
              child: Text(
                "Login Page",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    CustomTextField(
                      textEditingController:
                          loginController.usernameController,
                      hintText: "Username",
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      textEditingController:
                          loginController.passwordController,
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
            ),
          ),
        ),
      ],
    );
  }
}
