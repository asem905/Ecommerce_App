import 'package:ecommerce/constants/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceQuantity extends StatelessWidget {
  final int quantity;
  final int price;
  final void Function()? onPressedadd;
  final void Function()? onPressedremove;
  const PriceQuantity({super.key,required this.onPressedadd,required this.onPressedremove, required this.quantity, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: onPressedadd, icon: Icon(Icons.add)),
                        Container(
                          width: 50,
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                          child: Text("$quantity",style: TextStyle(fontSize: 20,height: 1.2)),),
                        IconButton(onPressed: onPressedremove, icon: Icon(Icons.remove)),
                      ],
                    ),
                    Spacer(),
                    Text("$price\$",style: TextStyle(color: AppColor.primaryColor,fontSize: 30,fontFamily: "playfairDisplay",height: 1.3),),
                  ],
                );
  }
}