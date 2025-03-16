import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/controller/myfavourite_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';

import 'package:ecommerce/data/model/myfavourite.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
class Customlistfavouriteitems extends GetView<MyFavouritePageController> {
  final MyFavouritesModel itemsFavModel;
  const Customlistfavouriteitems({super.key,required this.itemsFavModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
              child: Card(
                child: Padding(padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(tag: "${itemsFavModel.itemId}", 
                      child: CachedNetworkImage(imageUrl: "${AppLink.imageitems}/${itemsFavModel.itemImage}",height: 100,fit: BoxFit.fill,),),
                      Text("${translateDataBase(itemsFavModel.itemName,itemsFavModel.itemNameAr)}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.primaryColor),),
                      Text("${translateDataBase(itemsFavModel.itemDesc,itemsFavModel.itemDescAr)}",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: AppColor.black),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rating 4.5",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: AppColor.black),),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                            children: [
                              ...List.generate(5,(index) => Icon(Icons.star,color: AppColor.primaryColor,size: 10,))
                            ],
                          ),
                          )
                          ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${itemsFavModel.itemPrice}\$",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: AppColor.primaryColor,fontFamily: "sans"),),
                          IconButton(onPressed: (){
                            controller.deleteData(itemsFavModel.favouriteId.toString());
                          }, icon: Icon(Icons.delete,
                          color: AppColor.primaryColor,))
                        ],
                      )
                    ],
                ),)
              ),
            );
  }
}