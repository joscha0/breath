import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool running = false.obs;

  void start() {
    running.value = true;
  }
}
