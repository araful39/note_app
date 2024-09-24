import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:note_app/view/screen/home/home.dart';
import 'package:note_app/view/screen/sign_in.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onReady() {
    super.onReady();

    firebaseUser.bindStream(_auth.authStateChanges());

    ever(firebaseUser, nextScreen);
  }

  nextScreen(User? user)async {
    if (user == null) {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(() => const SignIn());

    } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(() => const Home());
    }
  }
}
