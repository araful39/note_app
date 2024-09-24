import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Center(
              child: Text(
                'menu'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('home'.tr), // Translated text
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text('log_out'.tr), // Translated text
            onTap: () async {
              await homeController.logOut();
            },
          ),
        ],
      ),
    );
  }
}
