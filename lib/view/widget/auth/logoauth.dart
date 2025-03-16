import 'package:ecommerce/constants/imageasset.dart';
import 'package:flutter/material.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo,height: 230,fit: BoxFit.cover,);
  }
}