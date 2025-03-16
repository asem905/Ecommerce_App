import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
class TestData {
  Crud crud;
  TestData(this.crud);
  getdata()async{
    var response =await crud.postdata(AppLink.test, {});
    return response.fold((l)=>l, (r)=>r);
  }
  
}
