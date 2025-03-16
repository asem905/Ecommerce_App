import 'package:ecommerce/constants/space.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppbar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedsearch;
  final void Function()? onPressedIconfav;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppbar({super.key, required this.titleappbar,required this.onPressedsearch,required this.onPressedIconfav,required this.onChanged, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child:Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            controller: mycontroller,
            decoration: InputDecoration(
              prefixIcon: IconButton(onPressed: onPressedsearch, icon: Icon(Icons.search)),
              hintText: titleappbar,
              hintStyle: const TextStyle(fontSize: 18),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          )
        ),
        SizedBox(width: 10),  
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10)
          ),
          child: IconButton(
            onPressed: onPressedIconfav,
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 30,
              color: Colors.grey[600]
            ),
          ),
        )
      ],
    )
    );
  }
}