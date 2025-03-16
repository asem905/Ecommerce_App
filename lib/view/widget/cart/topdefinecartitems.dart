import 'package:ecommerce/constants/color.dart';
import 'package:flutter/material.dart';

class Topdefinecartitemsnum extends StatelessWidget {
  final String message;
  const Topdefinecartitemsnum({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
          ),
          child: Text(message,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
          );
  }
}