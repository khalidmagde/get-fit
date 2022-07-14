import 'package:flutter/cupertino.dart';
import 'package:get_fit/constants/screenutil.dart';

class Space extends StatelessWidget {
  final double boxWidth;
  final double boxHeight;
  const Space({this.boxHeight = 0, this.boxWidth = 0});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(boxHeight),
      width: width(boxWidth),
    );
  }
}
