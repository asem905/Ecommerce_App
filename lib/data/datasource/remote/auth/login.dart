import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String useremail,String userpassword)async{
    var response =await crud.postdata(AppLink.Login, {
      "useremail":useremail,
      "userpassword":userpassword,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}