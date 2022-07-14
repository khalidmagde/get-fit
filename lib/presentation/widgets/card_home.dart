import 'package:flutter/material.dart';

import '../../constants/screenutil.dart';
import '../../constants/text_styles.dart';

class CardHome extends StatelessWidget {
  const CardHome({Key? key,required this.title, required this.image, required this.onTap, required this.color}) : super(key: key);
  final String title;
  final String image;
  final Color color;
  final Function() onTap;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image),
            Text(title,style: widgetTitle,),
            SizedBox(width: width(40),child: Divider(thickness: 2,color: color,),)
          ],
        ),
      ),
    );
  }
}
