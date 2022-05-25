import 'package:get/get.dart';
class PasswordControler extends GetxController{
late RxBool obscureText = true.obs ;
onChange(){
  obscureText.value = !obscureText.value;
}
}