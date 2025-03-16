import 'package:ecommerce/controller/cartcontroller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cartdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:get/get.dart';
abstract class ProductdetailsController extends GetxController{
  initialData();
}
class ProductdetailsControllerImp extends ProductdetailsController{
  CartData cartData=CartData(Get.find());
  Statusrequest statusrequest=Statusrequest.none;
  Myservices myservices=Get.find();
  late ItemsModel itemsModel;
  int countOfItems=0;
  additems(int itemsid) async {
    statusrequest=Statusrequest.loading;
    update();
    var response=await cartData.addCart(myservices.sharedpref.getString("id")!.toString(),itemsid);  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        Get.snackbar("Alert", "Successfully Added To Cart");
      }else{
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to add to cart",
        );
        statusrequest=Statusrequest.failure;
      }
    }
    update();
  }

  deleteitems(int itemId) async{
    statusrequest=Statusrequest.loading;
    update();
    var response=await cartData.removeCart(myservices.sharedpref.getString("id")!.toString(),itemId);  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        Get.snackbar("Alert", "Successfully Deleted From Cart");
      }else{
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to Delete from Cart",
        );
        statusrequest=Statusrequest.failure;
      }
    }
    update();
  }
  getcountitems(int itemId) async{
    statusrequest=Statusrequest.loading;
    var response=await cartData.getcount(myservices.sharedpref.getString("id")!.toString(),itemId);  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        var countItems=0;
        countItems=int.parse(response['data'].toString());
        print(countItems);
        return countItems;
      }else{
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to get count from cart",
        );
        statusrequest=Statusrequest.failure;
      }
    }
  }
  List subItems=[
    {
      "name":"Red",
      "id":1,
      "active":true,
    },
    {
      "name":"Black",
      "id":2,
      "active":false,
    },
    {
      "name":"Blue",
      "id":3,
      "active":false,
    },
  ];
  add(){
    additems(itemsModel.itemId!);//by adding to cart
    countOfItems++;
    update();
  }
  remove(){
    if(countOfItems>0){
      deleteitems(itemsModel.itemId!);//by removing from cart
      countOfItems--;
      update();
    }else{
      countOfItems=0;
    }
  }
  @override
  initialData()async{
    itemsModel=Get.arguments['itemsModel'];
    statusrequest=Statusrequest.loading;
    countOfItems=await getcountitems(itemsModel.itemId! );
    statusrequest=Statusrequest.success;
    update();
  }
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}