import 'package:get/get.dart';

class ChangeScreen extends GetxController {
  var index = 0.obs;
  void setIndex(int index) {
    this.index(index);
  }

  var name = "Dog".obs;
  void setName(String name) {
    this.name(name);
  }
}
