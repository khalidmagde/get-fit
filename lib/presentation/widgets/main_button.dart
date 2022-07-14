import 'package:flutter/material.dart';
import 'package:get_fit/constants/text_styles.dart';

import '../../constants/screenutil.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.text, required this.onPressed,}) : super(key: key);
  final String text;
  final Function() onPressed;
  // final double paddingNum;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: paddingNum),
        width: screenWidth,
        height: height(65),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xFFD52424),),
        child: Center(child: Text(text,style: buttonText,),),
      ),
    );
  }
}
