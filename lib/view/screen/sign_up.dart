import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/constant/validate.dart';
import 'package:note_app/controller/sign_up_controller.dart';
import 'package:note_app/view/common_widget/elevated_button.dart';
import 'package:note_app/view/screen/sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SingUpController singUpController = Get.put(SingUpController());
    final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "sign_up".tr, // Translation
                style: const TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                          AppValidator.validateEmptyText("name".tr, value), // Translation
                      controller: singUpController.nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintStyle: const TextStyle(color: Colors.black),
                        hintText: "name".tr, // Translation
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) => AppValidator.validateEmail(value),
                      controller: singUpController.emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "email".tr, // Translation
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      validator: (value) =>
                          AppValidator.validateEmptyText("phone_number".tr, value), // Translation
                      controller: singUpController.phoneNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        hintText: "phone_number".tr, // Translation
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(() => TextFormField(
                      validator: (value) =>
                          AppValidator.validatePassword(value),
                      controller: singUpController.passwordController,
                      obscureText: singUpController.hidePassword.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        hintText: "password".tr, // Translation
                        suffixIcon: IconButton(
                          onPressed: () {
                            singUpController.hidePassword.value =
                            !singUpController.hidePassword.value;
                          },
                          icon: Icon(singUpController.hidePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        hintStyle: const TextStyle(color: Colors.black),
                      ),
                    )),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: Get.width,
                      child: CustomElevatedButton(
                        child: Text(
                          "sign_up_button".tr, // Translation
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          singUpController.signUp(signUpFormKey);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already_have_account".tr), // Translation
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignIn());
                    },
                    child: Text(
                      "sign_in".tr, // Translation
                      style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

