import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TopAppbarcart extends StatelessWidget {
  final String title;
  const TopAppbarcart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Container(alignment: Alignment.centerLeft,
                                child: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios)),),
                Expanded(child: Container(alignment: Alignment.center,
                                child: Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),),
                Container(alignment: Alignment.centerLeft,
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_sharp)),),
              ],
            ),
          );
  }
}