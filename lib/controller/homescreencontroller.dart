import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/myfavourite.dart';
import 'package:ecommerce/view/screen/settings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
abstract class Homescreencontroller extends GetxController{
  changePage(int i);
}
class HomescreencontrollerImp extends Homescreencontroller{
  int currentIndex=0;
  List<Widget> listpage=[
    Home(),
    Settings(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.person_2_outlined),
        Center(child: Text("Profile"),)
      ],
    ),
    MyFavourite(),
  ];
  List ButtomAppBar=[
    {
      "title":"Home",
      "icon":Icons.home,
    },
    {
      "title":"Settings",
      "icon":Icons.settings,
    },
    {
      "title":"Profile",
      "icon":Icons.person_2_outlined,
    },
    {
      "title":"notify",
      "icon":Icons.notifications_active_outlined,
    }

  ];
  @override
  changePage(int i) {
    currentIndex=i;
    update();
  }


}