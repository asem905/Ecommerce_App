import 'package:ecommerce/constants/color.dart';
import 'package:flutter/material.dart';

class Custombuttonlang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const Custombuttonlang({super.key, required this.textButton,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
            child: MaterialButton(
              color: AppColor.primaryColor,
              textColor: Colors.white,
              onPressed: onPressed,child: Text(textButton,style: TextStyle(fontWeight: FontWeight.bold),),),
            );
  }
}