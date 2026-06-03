import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // ignore: non_constant_identifier_names
  final CarousalCurrentIndex = 0.obs;

  void updatePageIndicator (index) {
    CarousalCurrentIndex.value = index;
  }
}