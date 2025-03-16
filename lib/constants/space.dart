import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class Space extends StatelessWidget {
  final double space_val;
  const Space({super.key, required this.space_val});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space_val,);
  }
}