import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String useremail,String userpassword)async{
    var response =await crud.postdata(AppLink.resetpassword, {
      "email":useremail,
      "password":userpassword,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}