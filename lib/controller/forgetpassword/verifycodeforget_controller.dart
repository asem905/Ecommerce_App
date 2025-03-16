import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/forgetpassword/verifycodeforgetpassword.dart';
import 'package:get/get.dart';
abstract class VerifycodeforgetController extends GetxController{
  checkcode();
  goToResetPassword(String VerifyCode);
}
class verifycodecontrollerforgetpasswordimp extends VerifycodeforgetController{
  String? email;
  // ignore: non_constant_identifier_names
  VerifyCodeForgetPasswordData VerifyCodeForgetPassword_data=VerifyCodeForgetPasswordData(Get.find());
  Statusrequest statusrequest=Statusrequest.none;
  @override
  checkcode() {      
  }

  @override
  // ignore: non_constant_identifier_names
  goToResetPassword(String VerifyCode) async{
   statusrequest=Statusrequest.loading;
          update();
          var response=await VerifyCodeForgetPassword_data.postdata(email!,VerifyCode);
          statusrequest=handlingData(response);
          print(statusrequest.toString());
          if(statusrequest==Statusrequest.success){
            if(response['status']=="success"){
              // data.addAll(response['success']);
              // print(data);
              Get.offNamed(AppRoute.resetPassword,arguments: {
                "email":email
              });
            }else{
              Get.defaultDialog(
                title: "Error",
                middleText: "Verify Code Is Not Correct",
              );
              statusrequest=Statusrequest.failure;
            }
        }
        update();
  }
  @override
  void onInit(){
    email=Get.arguments['email'];
    super.onInit();
  }
  
}