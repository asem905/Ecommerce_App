import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
class VerifyCodeSignUpData {
  Crud crud;
  VerifyCodeSignUpData(this.crud);
  postdata(String email,String verifyCode)async{
    var response =await crud.postdata(AppLink.VerifyCodeSignup, {
      "email":email,
      "verifycode":verifyCode,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  resenddata(String email)async{
    var response =await crud.postdata(AppLink.resendCodeSignup, {
      "email":email,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}