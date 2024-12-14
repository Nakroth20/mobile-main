import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostku/app/routes/app_pages.dart';
import '../../controllers/Login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            Text("LOGIN"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(
                labelText: "Email",
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Obx(() => TextField(
              controller: controller.passwordController,
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                labelText: "Kata Sandi",
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    controller.isPasswordVisible.value =
                    !controller.isPasswordVisible.value;
                  },
                ),
              ),
            )),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Forgot password logic
                },
                child: Text(
                  "lupa kata sandi ?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 16),
            Obx(() => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.signInWithEmailAndPassword(),
                child: controller.isLoading.value
                    ? CircularProgressIndicator(
                  color: Colors.white,
                )
                    : Text("LOGIN"),
              ),
            )),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("atau login dengan"),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: controller.isLoading.value
                  ? null
                  : () => controller.signInWithGoogle(),
              icon: Image.asset(
                'assets/Google.png', // Ensure the Google icon is in assets
                width: 24,
                height: 24,
              ),
              label: Text("Google"),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTER);// Navigation to signup
              },
              child: Text.rich(
                TextSpan(
                  text: "Belum punya akun? ",
                  children: [
                    TextSpan(
                      text: "Daftar disini",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
