import 'package:ecommerce/core/class/statusrequest.dart';

handlingData(response){
  if(response is Statusrequest){
    return response;
  }else{
    return Statusrequest.success;
  }
}