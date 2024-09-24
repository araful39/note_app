import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/splash_controller.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return  Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text('Welcome To\n Note App'.tr,style: TextStyle(fontSize: 40,color:Colors.white ),),
      ),
    );
  }
}
