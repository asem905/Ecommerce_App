import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/constants/space.dart';
import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/itemsdetails/price_quantity.dart';
import 'package:ecommerce/view/widget/itemsdetails/subitemslist.dart';
import 'package:ecommerce/view/widget/itemsdetails/toppageproductdetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
class ProductDetails extends StatelessWidget {
  // final ItemsModel itemsModel;
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductdetailsControllerImp controller=Get.put(ProductdetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: (){
            Get.toNamed(AppRoute.cart);
          },color: AppColor.secondaryColor,
          child: Text("Go To Cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          
      ),
      body: GetBuilder<ProductdetailsControllerImp>(builder: (controller){
        return Handlindataview(statusrequest: controller.statusrequest, widget: ListView(
        children: [
          Toppageproductdetails(),
          Container(height: 40,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${controller.itemsModel.itemName}",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.fourthcolor),),
                PriceQuantity(onPressedadd: (){
                  controller.add();
                }, onPressedremove: (){
                  controller.remove();
                }, quantity: controller.countOfItems, price: controller.itemsModel.itemPrice!,),
                Space(space_val: 10),
                Text("${controller.itemsModel.itemDesc}${controller.itemsModel.itemDesc}${controller.itemsModel.itemDesc}${controller.itemsModel.itemDesc}${controller.itemsModel.itemDesc}"
                ,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),
                Space(space_val: 10),
                // Text("Color",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.fourthcolor),),
                // Space(space_val: 10),
                // Subitemslist(),
              
              ],
            ),
          )
        ],
      ),);
      })
    );
  }
}