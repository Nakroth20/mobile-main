import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  // Sign in with email and password
  Future<void> signInWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.snackbar("Success", "Login successful");
      // Navigate to home or another screen after login
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Unknown error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
        Get.snackbar("Success", "Login with Google successful");
        // Navigate to home or another screen after login
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Unknown error occurred");
    } finally {
      isLoading.value = false;
    }
  }

  // Dispose controllers when not needed
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
