import 'package:ecommerce/controller/auth/signupcontroller.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:get/get.dart';
class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() =>SignUpcontrollerImp(),fenix: true);
  }
  
}