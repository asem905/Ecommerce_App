import 'package:ecommerce/constants/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish=ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "playfairDisplay",
        textTheme: TextTheme(
          headlineMedium: TextStyle(height: 2,fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,),
          headlineLarge: TextStyle(height: 2,fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26,),
          bodyMedium: TextStyle(color: AppColor.grey,height: 2,fontWeight: FontWeight.bold,fontSize: 17,),
        )
      );
ThemeData themeArabic=ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Cairo",
        textTheme: TextTheme(
          headlineMedium: TextStyle(height: 2,fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,),
          headlineLarge: TextStyle(height: 2,fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26,),
          bodyMedium: TextStyle(color: AppColor.grey,height: 2,fontWeight: FontWeight.bold,fontSize: 17,),
        )
      );