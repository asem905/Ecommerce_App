import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functions/handlingdatacontroller.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';
class TestController extends GetxController {
  TestData testData=TestData(Get.find());
  List data=[];
  late Statusrequest statusrequest;
  getData()async{
    statusrequest=Statusrequest.loading;
    var response=await testData.getdata();
    statusrequest=handlingData(response);
    if(statusrequest==Statusrequest.success){
      if(response['status']=="failure"){
        statusrequest=Statusrequest.failure;
      }else{
        data.addAll(response['data']);
      }
    }
    update();
  }
  @override
  void onInit() async{
    await getData();
    super.onInit();
  }
}