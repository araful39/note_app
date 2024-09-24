import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/splash_controller.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return  Scaffold(
      body: Center(
        child: Text('welcome'.tr,style: TextStyle(fontSize: 30,color: Colors.indigo),),
      ),
    );
  }
}
