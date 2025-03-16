import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController{
  logout();
}
class SettingsControllerImp extends SettingsController {
  Myservices myservices = Get.find();
  @override
  logout() {
    myservices.sharedpref.clear();
    Get.offAllNamed(AppRoute.login);
  }

}