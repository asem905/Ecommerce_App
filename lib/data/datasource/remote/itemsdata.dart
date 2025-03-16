import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getdata(String userId,String categoryid)async{
    var response =await crud.postdata(AppLink.items, {
      "user_id":userId.toString(),
      "category_id":categoryid.toString()
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}
