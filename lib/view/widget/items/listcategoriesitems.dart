import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class Listcategoriesitems extends GetView<ItemscontrollerImp> {
  const Listcategoriesitems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (_, index) => Categories(categoriesModel: CategoriesModel.fromJson(controller.categories[index]),selectedcat: index),
      ),
    );
  }
}
class Categories extends GetView<ItemscontrollerImp> {
  final CategoriesModel categoriesModel;
  final int selectedcat;
  const Categories({super.key, required this.categoriesModel,required this.selectedcat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeSelectedCat(selectedcat,categoriesModel.categoryId!.toString());
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<ItemscontrollerImp>(builder: (controller)=>Container(
              padding: EdgeInsets.only(right: 10,left: 10,bottom: 5),
              decoration:controller.selectedcat==selectedcat? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 3,color: AppColor.primaryColor),
                ),
              ):null,
              child: Text("${translateDataBase(categoriesModel.categoryName,categoriesModel.categoryNameAr)}",style: TextStyle(fontSize: 20,color:AppColor.grey2),),
            ))
          ],
        ),
    );
  }
}