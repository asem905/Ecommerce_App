import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String userId,int itemsid)async{
    var response =await crud.postdata(AppLink.cartAdd, {
      "user_id":userId.toString(),
      "item_id":itemsid.toString()
    });
    return response.fold((l)=>l, (r)=>r);
  }
  removeCart(String userId,int itemsid)async{
    var response =await crud.postdata(AppLink.cartRemove, {
      "user_id":userId.toString(),
      "item_id":itemsid.toString()
    });
    return response.fold((l)=>l, (r)=>r);
  }
  getcount(String userId,int itemsid)async{
    var response =await crud.postdata(AppLink.cartCount, {
      "user_id":userId.toString(),
      "item_id":itemsid.toString()
    });
    return response.fold((l)=>l, (r)=>r);
  }
  viewcart(String userId)async{
    var response =await crud.postdata(AppLink.cartview, {
      "user_id":userId.toString(),
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}
