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
          Obx(
                () => UserAccountsDrawerHeader(
              accountName: Text(
                homeController.user.value.name ?? 'No Name', // Display user name
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              accountEmail: Text(
                homeController.user.value.email ?? 'No Email', // Display user email
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.indigo,
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.indigo,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home,color: Colors.indigo,),
            title: Text('home'.tr,style: TextStyle(color: Colors.indigo,),), // Translated text
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout,color: Colors.indigo,),
            title: Text('log_out'.tr,style: TextStyle(color: Colors.indigo,),), // Translated text
            onTap: () async {
              await homeController.logOut();
            },
          ),
        ],
      ),
    );
  }
}
