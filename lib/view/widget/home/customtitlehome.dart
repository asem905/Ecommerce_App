import 'package:ecommerce/constants/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Customtitlehome extends StatelessWidget {
  final String title;
  const Customtitlehome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor
                    ),
                  ),
    );
  }
}