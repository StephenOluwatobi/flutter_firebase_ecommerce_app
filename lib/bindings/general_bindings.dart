import 'package:flutter_firebase_ecommerce_app/utils/http/network_manager.dart';
import 'package:get/instance_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies (){
    Get.put(NetworkManager());
  }
} 