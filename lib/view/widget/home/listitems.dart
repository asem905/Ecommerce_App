import 'package:ecommerce/controller/homepage_controller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomepageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    print("${controller.items.length}");
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => ItemsHome(itemsModel: ItemsModel.fromJson(controller.items[index]),)
      ),
    );
  }
}
class ItemsHome extends StatelessWidget {
  ItemsModel itemsModel;
  ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Positioned(
              left: -10,
              top: 0,
              right: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 120,
                width: 240,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      "${AppLink.imageitems}/${itemsModel.itemImage}"
                    ),
                  )
                ),
              ),
            ),
            Container(
              height: 120,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              left: 10,
              child: Text(
                "${itemsModel.itemName}",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
            )
          ],
        );
  }
}