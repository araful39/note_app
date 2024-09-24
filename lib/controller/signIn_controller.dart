import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:note_app/view/screen/home.dart';

class SignInController extends GetxController {
  RxBool hidePassword = true.obs;

  // final privacyPolicy = false.obs;
  final TextEditingController email =
      TextEditingController(text: "exmaple@gmail.com");
  final TextEditingController password =
      TextEditingController(text: '12345678');

  Future<void> signIn(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      EasyLoading.show();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        await Future.delayed(const Duration(seconds: 2));
        EasyLoading.dismiss();
        EasyLoading.showSuccess('SignIn success!');
        Get.offAll(() => Home());
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();

        if (e.code == 'user-not-found') {
          EasyLoading.showError('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          EasyLoading.showError('Wrong password provided for that user.');
        } else {
          EasyLoading.showError('SignIn failed. Please try again.');
        }
      } catch (e) {
        EasyLoading.dismiss();
        EasyLoading.showError('An unexpected error occurred.');
        print(e);
      }
    }
  }
}
