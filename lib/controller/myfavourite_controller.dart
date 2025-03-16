import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favouritedata.dart';
import 'package:ecommerce/data/datasource/remote/myfavourite_pagedata.dart';
import 'package:ecommerce/data/model/myfavourite.dart';
import 'package:get/get.dart';
class MyFavouritePageController extends GetxController{
  List<MyFavouritesModel> data=[]; 
  MyFavouritePageData favouriteData=MyFavouritePageData(Get.find());
  Statusrequest statusrequest=Statusrequest.none;
  Myservices myservices=Get.find();
  getData()async{
    statusrequest=Statusrequest.loading;
    update();
    var response=await favouriteData.getdata(myservices.sharedpref.getString("id")!.toString());  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        List responseData=response['data'];
        data.addAll(responseData.map((e)=>MyFavouritesModel.fromJson(e)));
      }else{
        statusrequest=Statusrequest.failure;
      }
    }
    update();
  }
  deleteData(String fav_id){
    favouriteData.deletedata(fav_id);  
    data.removeWhere((element)=>element.favouriteId.toString()==fav_id);
    update();
  }
  @override
  void onInit() async{
    await getData();
    super.onInit();
  }
}
