import 'package:ecommerce/constants/color.dart';
import 'package:ecommerce/constants/imageasset.dart';
import 'package:ecommerce/constants/space.dart';
import 'package:ecommerce/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Container(
        child: ListView(
          children: [
            Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(height: Get.width/2.5,color: AppColor.primaryColor,),
            Positioned(top: Get.width/3.5,child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100)
              ),
              child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[100],
              backgroundImage: AssetImage(AppImageAsset.user,bundle: null),
            ),
            )),
            
          ],
        ),
        Space(space_val: 100),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Card(
          child: Column(
            children: [
              ListTile(
                onTap: (){},
                title: Text("Disable Notifications"),
                trailing: Switch(value: true, onChanged: (val){}),
              ),
              //Divider(),
              ListTile(
                onTap: (){},
                title: Text("Address"),
                trailing: Icon(Icons.location_on_outlined),
              ),
              //Divider(),
              ListTile(
                onTap: (){},
                title: Text("About Us"),
                trailing: Icon(Icons.help_outline_outlined),
              ),
              //Divider(),
              ListTile(
                onTap: (){},
                title: Text("Contact Us"),
                trailing: Icon(Icons.phone_callback_outlined),
              ),
              //Divider(),
              ListTile(
                onTap: (){
                  controller.logout();
                },
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
              ), 
            ],
          )
        ),
        )
        ],
      )
    );  
  }
}