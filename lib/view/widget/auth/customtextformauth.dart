import 'dart:ffi';

import 'package:ecommerce/constants/color.dart';
import 'package:flutter/material.dart';

class Customtextformauth extends StatelessWidget {
  final String hinttext;
  // ignore: non_constant_identifier_names
  final String LabelText;
  final IconData icondata;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  // ignore: non_constant_identifier_names
  const Customtextformauth({super.key,this.onTapIcon,this.obscureText, required this.hinttext, required this.LabelText, required this.icondata, required this.mycontroller,required this.validator, required this.isNumber});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: validator,
        keyboardType: isNumber?TextInputType.numberWithOptions(decimal: true):TextInputType.text,
            controller: mycontroller,
            obscureText: obscureText==null || obscureText==false? false : true ,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: TextStyle(fontSize: 14,color: AppColor.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 30),
              label: Container(margin: EdgeInsets.symmetric(horizontal: 7),child: Text(LabelText),),
              suffixIcon: InkWell(
                child: Icon(icondata),
                onTap: onTapIcon,
              ),
              
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              )
            ),
          ),
    );
  }
}