import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Toppageproductdetails extends GetView<ProductdetailsControllerImp> {
  const Toppageproductdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: 180,decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              ),
              Positioned(top: 40,right: Get.width/8,left: Get.width/8,child: Hero(tag: "${controller.itemsModel.itemId}", child: CachedNetworkImage(imageUrl: "${AppLink.imageitems}/${controller.itemsModel.itemImage}",height: 180,fit: BoxFit.fill,)),),
              
            ],
          );
  }
}