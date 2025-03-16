import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cartdata.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:get/get.dart';
class CartController extends GetxController{
  CartData cartData=CartData(Get.find());
  Statusrequest statusrequest=Statusrequest.none;
  Myservices myservices=Get.find();
  List<CartModel> data=[];
  double ordersPrice=0.0;
  int totalItems=0;
  add(int itemsid) async {
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

  delete(int itemId) async{
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
  resetVarCart(){
    ordersPrice=0.0;
    totalItems=0;
    data.clear();
  }
  refreshPage(){
    resetVarCart();
    view();
  }
  view() async{
    statusrequest=Statusrequest.loading;
    update();
    data.clear();
    var response=await cartData.viewcart(myservices.sharedpref.getString("id")!.toString());  
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="success"){
        data.clear();
        if(response['datacart']['status']=="success"){
          List respondata=response['datacart']['data'];
          Map countPriceResponse=response['countandprice'];
          ordersPrice=double.parse(countPriceResponse['totalprice'].toString());
          totalItems=int.parse(countPriceResponse['totalcount'].toString());
          data.addAll(respondata.map((e) => CartModel.fromJson(e)));
        }
      }else{
        Get.defaultDialog(
          title: "Error",
          middleText: "Failed to get count from cart",
        );
        statusrequest=Statusrequest.failure;
      }
    }
    update();
  }
  @override
  void onInit() {
    view();
    super.onInit();
  }
  @override
  void dispose() {

    super.dispose();
  }
}