import 'package:ecommerce/controller/homescreencontroller.dart';
import 'package:ecommerce/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';  

class CustombuttonNavbar extends StatelessWidget {
  const CustombuttonNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreencontrollerImp>(builder: (controller)=>BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 0),
        
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
              ...List.generate(controller.listpage.length+1, (index) {
                if(index==2){return Spacer();}
                return CustomButtonAppBar(onPressed: (){controller.changePage(index>2?index-1:index);},
                 text: controller.ButtomAppBar[index>2?index-1:index]['title'], iconData: controller.ButtomAppBar[index>2?index-1:index]['icon'],
                  active: controller.currentIndex==(index>2?index-1:index)?true:false);
              }),
            ],
        ),
      )) ; 
  }
}