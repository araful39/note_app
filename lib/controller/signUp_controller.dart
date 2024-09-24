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
  final TextEditingController name =
      TextEditingController(text: 'Md.Araful');

  final TextEditingController email =
      TextEditingController(text: "rajuslam39@gmail.com");
  final TextEditingController phoneNumber =
      TextEditingController(text: "01911111111");
  final TextEditingController password =
      TextEditingController(text: "12345678");

  Future<void> signUp(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      EasyLoading.show(); // Show loading indicator
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        await FirebaseFirestore.instance.collection('users').doc(credential.user?.uid).set({
          'name': name.text,
          'email': email.text,
          'password': password.text, // Consider hashing the password if needed
          'createdAt': FieldValue.serverTimestamp(), // Save the timestamp of creation
        });
        await Future.delayed(const Duration(seconds: 2));
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
}
