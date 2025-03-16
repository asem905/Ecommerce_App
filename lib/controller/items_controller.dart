import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/itemsdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends  SearchMixController{ 
  initialData();
  changeSelectedCat(int? index,String categoryid);
  getitems(String categoryid);
  goToPageProductdetails(ItemsModel itemsModel);
}

class ItemscontrollerImp extends ItemsController{
  List categories= [];
  Myservices myservices=Get.find();
  List items= [];
  String? categoryid;
  int? selectedcat;
  ItemsData itemsData=ItemsData(Get.find());
  Statusrequest statusrequest=Statusrequest.none;
  bool issearch=false;
  checkSearch(val){
    if(val==""){
      issearch=false;
    }
    update();
  }
  onsearch(){
    issearch=true;
    searchItemsData();
    update();
  }
  @override
  getitems(String categoryid)async{
    statusrequest=Statusrequest.loading;
    update();
    var response=await itemsData.getdata(myservices.sharedpref.getString("id")!.toString(),categoryid);  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        items.clear(); 
        items.addAll(response['data']);
      }else{
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to import data",
        );
        statusrequest=Statusrequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    
    initialData();
    super.onInit();
  }
  @override
  initialData() {
    searchcont=TextEditingController();
    categories=Get.arguments['categories'];
    selectedcat=Get.arguments['selectedcat'];
    getitems(Get.arguments['categoryid'].toString(),);
  }
  
  @override
  changeSelectedCat(int? index,String categoryid) { 
    getitems(categoryid);
    selectedcat=index;
    update();
  }
  
  @override
  goToPageProductdetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productdetails,arguments:{
      "itemsModel":itemsModel
    });  
  }
}