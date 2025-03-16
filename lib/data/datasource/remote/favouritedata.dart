import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
class FavouriteData {
  Crud crud;
  FavouriteData(this.crud);
  addFavourite(String userId,String itemsid)async{
    var response =await crud.postdata(AppLink.favouriteAdd, {
      "user_id":userId.toString(),
      "item_id":itemsid.toString()
    });
    return response.fold((l)=>l, (r)=>r);
  }
  removeFavourite(String userId,String itemsid)async{
    var response =await crud.postdata(AppLink.favouriteRemove, {
      "user_id":userId.toString(),
      "item_id":itemsid.toString()
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}
