import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/constant/validate.dart';
import 'package:note_app/controller/signIn_controller.dart';
import 'package:note_app/view/common_widget/elevated_button.dart';
import 'package:note_app/view/screen/sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());
    final GlobalKey<FormState> signInFormkey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "sign_in".tr,  // Translated text for "Sign In"
                style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: signInFormkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) => AppValidator.validateEmail(value),
                        controller: signInController.emailController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            labelText: "email".tr, // Translated text for "Email"
                            labelStyle: const TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                            () => TextFormField(
                          validator: (value) => AppValidator.validatePassword(value),
                          controller: signInController.passwordController,
                          obscuringCharacter: "*",
                          obscureText: signInController.hidePassword.value,
                          decoration: InputDecoration(
                            helperStyle: const TextStyle(color: Colors.black),
                            prefixIcon: const Icon(Icons.key),
                            labelText: "password".tr,  // Translated text for "Password"
                            labelStyle: const TextStyle(color: Colors.black),
                            suffixIcon: IconButton(
                              onPressed: () {
                                signInController.hidePassword.value =
                                !signInController.hidePassword.value;
                              },
                              icon: signInController.hidePassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                        child:  Text(
                          'sign_in'.tr, // Translated text for "Sign In"
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          signInController.signIn(signInFormkey);
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("Create a account?"),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const SignUp());
                      },
                      child: Text(
                        "sign_up".tr,
                        style: const TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}







