import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class Listcategorieshome extends GetView<HomepageControllerImp> {
  const Listcategorieshome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (_, index) => Categories(categoriesModel: CategoriesModel.fromJson(controller.categories[index]),selectedcat: index),
      ),
    );
  }
}
class Categories extends GetView<HomepageControllerImp> {
  final CategoriesModel categoriesModel;
  final int selectedcat;
  const Categories({super.key, required this.categoriesModel,required this.selectedcat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories,selectedcat,categoriesModel.categoryId!.toString());
      },
      child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(
                    "${AppLink.imagecategories}/${categoriesModel.categoryImage}"
                  ),
                )
              ),
            ),
            Text(
              "${translateDataBase(categoriesModel.categoryName,categoriesModel.categoryNameAr)}",
              style: const TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
    );
  }
}