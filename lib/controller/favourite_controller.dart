import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favouritedata.dart';
import 'package:get/get.dart';
class FavouriteController extends GetxController{
  Map isFavourites={};
  FavouriteData favouriteData=FavouriteData(Get.find());
  Statusrequest statusrequest=Statusrequest.none;
  Myservices myservices=Get.find();
  setFavourite(String id,val){
    isFavourites[id]=val;
    update();
  }
  addToFavourite(String itemsid)async{
    statusrequest=Statusrequest.loading;
    update();
    var response=await favouriteData.addFavourite(myservices.sharedpref.getString("id")!.toString(),itemsid);  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        Get.snackbar("Alert", "Successfully Added To favourites");
      }else{
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to add to favourites",
        );
        statusrequest=Statusrequest.failure;
      }
    }
  }
  removeFromFavourite(String itemsid)async{
    statusrequest=Statusrequest.loading;
    update();
    var response=await favouriteData.removeFavourite(myservices.sharedpref.getString("id")!.toString(),itemsid);  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        Get.snackbar("Alert", "Successfully Reomved From favourites");
      }else{
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to reomve from favourites",
        );
        statusrequest=Statusrequest.failure;
      }
    }
  }
}
