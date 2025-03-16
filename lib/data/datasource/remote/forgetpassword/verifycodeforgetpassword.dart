import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String useremail,String userverifycode)async{
    var response =await crud.postdata(AppLink.VerifyCodeForgetpassword, {
      "email":useremail,
      "verifycode":userverifycode,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}