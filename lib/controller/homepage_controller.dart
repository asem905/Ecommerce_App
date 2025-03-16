import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/homedata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
abstract class HomepageController extends SearchMixController{
  initialDtata();
  getData();
  goToItems( List categories,int selectedcat,String categoryid);
}
class HomepageControllerImp extends HomepageController{
  Myservices myservices=Get.find();
  String? username;
  String? email;
  String? phone;
  String? id;
  String? lang;
  HomeData homeData=HomeData(Get.find());
  List categories=[];
  List items=[];
  late Statusrequest statusrequest;
  @override
  initialDtata(){
    lang=myservices.sharedpref.getString("lang");
    username=myservices.sharedpref.getString("username");
    email=myservices.sharedpref.getString("email");
    id=myservices.sharedpref.getString("id");
    phone=myservices.sharedpref.getString("phone");
  }
  @override
  void onInit() async{
    searchcont=TextEditingController();
    await getData();
    initialDtata();
    super.onInit();
  }
  
  @override
  getData() async{
    statusrequest=Statusrequest.loading;
    update();
    var response=await homeData.getdata() ;
    statusrequest=handlingData(response);
    print(statusrequest.toString());
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        categories.addAll(response['categories']['data']);   
        items.addAll(response['items']['data']);
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
  goToItems(List categories,int selectedcat,String categoryid) {
    Get.toNamed(AppRoute.items,arguments: {
      "categories":categories,
      "selectedcat":selectedcat,
      "categoryid":categoryid
    });
  }

  goToPageProductdetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productdetails,arguments:{
      "itemsModel":itemsModel
    });  
  }
}

// class SearchMixController   extends GetxController{
//   List<ItemsModel> listDataSearch=[];
//   TextEditingController? searchcont;
//   bool issearch=false;
//   HomeData homeData=HomeData(Get.find());
//   late Statusrequest statusrequest=Statusrequest.none;

//   searchItemsData() async{
//     statusrequest=Statusrequest.loading;
//     update();
//     var response=await homeData.searchdata(searchcont!.text.toString());
//     statusrequest=handlingData(response);
//     print(statusrequest.toString());
//     if(statusrequest==Statusrequest.success){
//       if(response['status']=="success"){
//         listDataSearch.clear();
//         List listResponseData=response['data'];
//         listDataSearch.addAll(listResponseData.map((e)=>ItemsModel.fromJson(e)));
//       }else{
//         Get.defaultDialog(
//           title: "Error",
//           middleText: "Failed to import data",
//         );
//         statusrequest=Statusrequest.failure;
//       }
//     }
//     update();
//   }
//   checkSearch(val){
//     if(val==""){
//       issearch=false;
//     }
//     update();
//   }
//   onsearch(){
//     issearch=true;
//     searchItemsData();
//     update();
//   }
// }
class SearchMixController extends GetxController{
  List<ItemsModel> listDataSearch=[];
  TextEditingController? searchcont;
  bool issearch=false;
  HomeData homeData=HomeData(Get.find());
  late Statusrequest statusrequest=Statusrequest.none;

  searchItemsData() async{
    statusrequest=Statusrequest.loading;
    update();
    var response=await homeData.searchdata(searchcont!.text.toString());
    statusrequest=handlingData(response);
    print(statusrequest.toString());
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        listDataSearch.clear();
        List listResponseData=response['data'];
        listDataSearch.addAll(listResponseData.map((e)=>ItemsModel.fromJson(e)));
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
}