import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/constant/validate.dart';
import 'package:note_app/controller/signUp_controller.dart';
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
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.indigo,
                    fontWeight: FontWeight.bold, fontSize:30),
              ),

              const SizedBox(
                height:20,
              ),
              Form(
                key: signUpFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                          AppValidator.validateEmptyText("Name", value),
                      controller: singUpController.name,
                      expands: false,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintStyle: TextStyle(color:Colors.black),
                          hintText: "Name"),
                    ),
                    const SizedBox(
                      height:15,
                    ),
                    TextFormField(
                      validator: (value) => AppValidator.validateEmail(value),
                      controller: singUpController.email,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) =>
                          AppValidator.validateEmptyText("Phone Number", value),
                      controller: singUpController.phoneNumber,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() => TextFormField(
                      validator: (value) =>
                          AppValidator.validatePassword(value),
                      controller: singUpController.password,
                      obscureText: singUpController.hidePassword.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        hintText: "Password",
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

                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width,
                      child: CustomElevatedButton(
                        child: const Text(
                         "Sign Up",
                          style: TextStyle(color:Colors.white),
                        ),
                        onPressed: () {
                          singUpController.signUp(signUpFormKey);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Al Ready Have An Account"),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const SignIn());
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
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

