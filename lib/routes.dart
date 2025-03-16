import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/core/middleware/mymiddleware.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/test.dart';
import 'package:ecommerce/view/productdetails.dart';
import 'package:ecommerce/view/screen/auth/checkemail.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycode_forgetpassword.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/home.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:ecommerce/view/screen/auth/success_signup.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/myfavourite.dart';
import 'package:ecommerce/view/screen/verifycodeSignUp.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/testview.dart';
import 'package:ecommerce/view/widget/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
List<GetPage<dynamic>>? routes=[
  GetPage(name: "/", page: () => Language(),middlewares: [Mymiddleware()]),
  //GetPage(name: "/", page: () => Cart()),
  //Auth
  GetPage(name: AppRoute.login, page: () => Login()), 
  GetPage(name: AppRoute.Signup, page: () => SignUp()), 
  GetPage(name: AppRoute.forgetpassword, page: () => ForgetPassword()), 
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()), 
  GetPage(name: AppRoute.verifyCode, page: () => VerifyCode()), 
  GetPage(name: AppRoute.verifyCode_forgetpassword, page: () => VerifyCodeForgetPassword()), 
  GetPage(name: AppRoute.successresetPassword, page: () => SuccessResetPassword()), 
  GetPage(name: AppRoute.successSignup, page: () => SuccessSignup()), 
  GetPage(name: AppRoute.checkEmail, page: () => CheckEmail()), 
  //view
  GetPage(name: AppRoute.onBoarding, page: () => OnBoarding()), 
  //home
  GetPage(name: AppRoute.home, page: ()=> HomeScreen()),
  GetPage(name: AppRoute.items, page: ()=> Items()),
  GetPage(name: AppRoute.productdetails, page: () => ProductDetails()),
  GetPage(name: AppRoute.myfavourite, page: ()=> MyFavourite()),
  GetPage(name: AppRoute.cart, page: () => Cart()), 
];
