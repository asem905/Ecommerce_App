import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
class Customlistitems extends GetView<ItemscontrollerImp> {
  final ItemsModel itemsModel;
  const Customlistitems({super.key,required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductdetails(itemsModel);
      },
              child: Card(
                child: Padding(padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(tag: "${itemsModel.itemId}", 
                      child: CachedNetworkImage(imageUrl: "${AppLink.imageitems}/${itemsModel.itemImage}",height: 100,fit: BoxFit.fill,),),
                      Text("${translateDataBase(itemsModel.itemName,itemsModel.itemNameAr)}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.primaryColor),),
                      Text("${translateDataBase(itemsModel.itemDesc,itemsModel.itemDescAr)}",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: AppColor.black),),
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
                          Text("${itemsModel.itemPrice}\$",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: AppColor.primaryColor,fontFamily: "sans"),),
                          GetBuilder<FavouriteController>(builder: (controllerfav){
                            return IconButton(
                              onPressed: (){
                                if(controllerfav.isFavourites[itemsModel.itemId.toString()] == 1){
                                  controllerfav.setFavourite(itemsModel.itemId.toString(), 0);
                                  controllerfav.removeFromFavourite(itemsModel.itemId.toString());
                                }else{
                                  controllerfav.setFavourite(itemsModel.itemId.toString(), 1);
                                  controllerfav.addToFavourite(itemsModel.itemId.toString());
                                }
                              },
                              icon: Icon(controllerfav.isFavourites[itemsModel.itemId.toString()]==1?Icons.favorite:Icons.favorite_border,color: AppColor.primaryColor,),
                              
                            );
                          }
                          )
                        ],
                      )
                    ],
                ),)
              ),
            );
  }
}