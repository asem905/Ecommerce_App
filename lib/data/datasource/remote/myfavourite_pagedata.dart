import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
class MyFavouritePageData {
  Crud crud;
  MyFavouritePageData(this.crud);
  getdata(String userId)async{
    var response =await crud.postdata(AppLink.favouriteview, {
      "user_id":userId.toString(),
    });
    return response.fold((l)=>l, (r)=>r);
  }
  deletedata(String favId)async{
    var response =await crud.postdata(AppLink.deletefromfavpage, {
      "fav_id":favId.toString(),
    });
    return response.fold((l)=>l, (r)=>r);
  }
}
