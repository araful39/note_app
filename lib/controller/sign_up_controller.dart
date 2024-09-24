import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:note_app/view/screen/sign_in.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  late final progress = false.obs;
  final TextEditingController nameController =
      TextEditingController(text: 'Md.Araful');

  final TextEditingController emailController =
      TextEditingController(text: "rajuslam39@gmail.com");
  final TextEditingController phoneNumberController =
      TextEditingController(text: "01911111111");
  final TextEditingController passwordController =
      TextEditingController(text: "12345678");

  Future<void> signUp(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      EasyLoading.show(); // Show loading indicator
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).set({
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text, // Consider hashing the password if needed
          'createdAt': FieldValue.serverTimestamp(), // Save the timestamp of creation
        });

        Get.offAll(() => const SignIn());
        EasyLoading.dismiss();
        EasyLoading.showSuccess('SignUp success!');
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();

        if (e.code == 'weak-password') {
          EasyLoading.showError('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          EasyLoading.showError('The account already exists for that email.');
        } else {
          EasyLoading.showError('SignUp failed. Please try again.');
        }
      } catch (e) {
        EasyLoading.dismiss();
        EasyLoading.showError('An unexpected error occurred.');
        print(e);
      }
    }
  }

  @override
  void dispose() {

    super.dispose();
    nameController.dispose();

  }
}
