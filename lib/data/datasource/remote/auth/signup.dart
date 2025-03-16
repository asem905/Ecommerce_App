import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postdata(String username,String useremail,String userpassword,String userphone)async{
    var response =await crud.postdata(AppLink.signUp, {
      "username":username,
      "useremail":useremail,
      "userpassword":userpassword,
      "userphone":userphone
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}