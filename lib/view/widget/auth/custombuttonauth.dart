import 'package:ecommerce/constants/color.dart';
import 'package:flutter/material.dart';

class Custombuttonauth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Custombuttonauth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    padding: EdgeInsets.all(13),
    color: AppColor.primaryColor,
    textColor: Colors.white,
    child:Text(text),
    ),
    );
  }
}