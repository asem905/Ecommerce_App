import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Subitemslist extends GetView<ProductdetailsControllerImp> {
  const Subitemslist({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  
                  children: [
                    ...List.generate(controller.subItems.length, (index)=>
                      Container(alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(bottom: 5),
                      height: 60,width: 90,decoration: BoxDecoration(
                        color: controller.subItems[index]['active']==true?AppColor.fourthcolor:Colors.white, //Colors.white,
                        border: Border.all(color: AppColor.fourthcolor,width: 2),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(controller.subItems[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,color: controller.subItems[index]['active']==true?Colors.white:AppColor.fourthcolor),),
                      ),
                    ),               
                  ],
                );
  }
}