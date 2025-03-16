import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/imageasset.dart';
import 'package:ecommerce/constants/space.dart';
import 'package:ecommerce/controller/cartcontroller.dart';
import 'package:ecommerce/core/class/handlindataview.dart';
import 'package:ecommerce/view/widget/cart/appbarcart.dart';
import 'package:ecommerce/view/widget/cart/buttom_navbar.dart';
import 'package:ecommerce/view/widget/cart/custombuttonnavbarcart.dart';
import 'package:ecommerce/view/widget/cart/customcardlist.dart';
import 'package:ecommerce/view/widget/cart/topdefinecartitems.dart';
import 'package:ecommerce/view/widget/language/custombuttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController=Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller){
        return Custombuttonnavbarcart(price: "${controller.ordersPrice}", shipping: "20", totalprice: "${controller.ordersPrice+20}",);
      }),
      body: GetBuilder<CartController>(builder: (controller){
        return Handlindataview(statusrequest: controller.statusrequest, widget: ListView(
        children: [
          TopAppbarcart(title: "My Cart"),
          Space(space_val: 10),
          Topdefinecartitemsnum(message: "You Have ${controller.totalItems} Items In Your Cart",),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
            children: [
            ...List.generate(controller.data.length, (index) =>Customcarditemslist(name: controller.data[index].itemName.toString(),
                                      price: controller.data[index].itemPrice.toString(), 
                                      count: controller.data[index].countitems.toString(), imagename: controller.data[index].itemImage.toString(),
                                       onAdd: () async{ await controller.add(controller.data[index].itemId!);controller.refreshPage(); },
                                       onRemove: () async{await controller.delete(controller.data[index].itemId!);controller.refreshPage();  },))
            ]
          ),
          )
        ],
      ),);
      })
    );
  }
}