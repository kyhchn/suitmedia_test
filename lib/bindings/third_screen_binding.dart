import 'package:get/get.dart';
import 'package:suitmedia_test/controller/third_screen_controller.dart';

class ThirdScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThirdScreenController());
  }
}
