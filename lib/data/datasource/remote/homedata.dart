import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
class HomeData {
  Crud crud;
  HomeData(this.crud);
  getdata()async{
    var response =await crud.postdata(AppLink.homepage, {});
    return response.fold((l)=>l, (r)=>r);
  }
  searchdata(String search)async{
    var response =await crud.postdata(AppLink.searchitems, {
      "search":search
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}
