import 'package:food_feed/controller/change_screen.dart';
import 'package:get/get.dart';

class AppStateBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ChangeScreen>(ChangeScreen());
  }
}
