import 'package:get/get.dart';

class PasswordController extends GetxController {
  late RxBool obscureText = true.obs;
  onChange() {
    obscureText.value = !obscureText.value;
  }
}
