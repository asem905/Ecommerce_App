import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String useremail)async{
    var response =await crud.postdata(AppLink.checkemail, {
      "useremail":useremail,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}