import 'package:ecommerce/constants/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData iconData;
  bool active=false;
  CustomButtonAppBar({super.key,required this.onPressed,required this.text, required this.iconData, required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(iconData,color:active? AppColor.primaryColor : AppColor.buttomnavtextcolor ,),
                  Text(text,style: TextStyle(color: active? AppColor.primaryColor : AppColor.buttomnavtextcolor ),),
                ],
              ),
              );
  }
}