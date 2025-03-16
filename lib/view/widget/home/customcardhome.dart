import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Customcardhome extends GetView<HomepageControllerImp> {
  final String title;
  final String body;
  const Customcardhome({super.key,required this.title,required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 150,
      child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20)
          ),
          height: 135,
          alignment: Alignment.center,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              body,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        Positioned(
          top: -20,
          right:controller.lang=="en"? -20:null,
          left: controller.lang=="ar"? -20:null,
          child: Container(
            height: 150,
            width: 140,
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(140)
            ),
          ),
        )
      ],
    ),
    );
  }
}