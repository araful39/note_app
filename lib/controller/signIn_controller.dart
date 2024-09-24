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

  signIn(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      EasyLoading.show();
      await Future.delayed(const Duration(seconds: 2));

      EasyLoading.dismiss();
      EasyLoading.showSuccess('LogIn success!');
      Get.offAll(() => const Home());
    }
  }
}
