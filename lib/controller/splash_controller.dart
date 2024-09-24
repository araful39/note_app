import 'package:get/get.dart';
import 'package:note_app/view/screen/sign_in.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    nextPage();
  }
   nextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const SignIn());
  }


}
