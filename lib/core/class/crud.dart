import 'dart:convert';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
class Crud{
  Future<Either<Statusrequest,Map>> postdata(linkurl,data)async{
    try{
      if(await CheckInternet()){
        var response=await http.post(Uri.parse(linkurl),body: data);
        print("===============================================================");
        if(response.statusCode==200 || response.statusCode==201){
          print("========================================${response.body}");
          Map responsebody=jsonDecode(response.body);
          return right(responsebody);
        }else{
          return left(Statusrequest.serverfailure);
        }
      }else{
        return left(Statusrequest.offlinefailure);
      }
    }catch(_){
      return left(Statusrequest.serverException);
    }
  }
}