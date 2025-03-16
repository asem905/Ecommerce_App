import 'package:ecommerce/constants/space.dart';
import 'package:ecommerce/view/widget/cart/buttom_navbar.dart';
import 'package:flutter/material.dart';

class Custombuttonnavbarcart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  const Custombuttonnavbarcart({super.key, required this.price, required this.shipping, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Price",style: TextStyle(fontSize: 16),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$",style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Shipping",style: TextStyle(fontSize: 16),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping\$",style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 16),child: Divider(color: Colors.black,thickness: 1,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total Price",style: TextStyle(fontSize: 16),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice\$",style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
          Space(space_val: 10),
          CustomButtonCart(textButton: "Place Order", onPressed: (){})
        ]
      ),
    );
  }
}