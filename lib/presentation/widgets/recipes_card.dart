import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/screenutil.dart';
import '../../constants/text_styles.dart';

class RecipesCard extends StatelessWidget {
  const RecipesCard({Key? key, this.navigate, this.img, this.title, this.time, this.calories}) : super(key: key);
final Function()? navigate;
final String? img,title;
final int? time,calories;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(navigate);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: height(120),
        width: width(170),
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(img!),
                opacity: 0.75,
                fit: BoxFit.fill),
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: titlePage,
            ),
            Text(
              '$time min cook time',
              style: buttonText,
            ),
            Text(
              '$calories cal',
              style: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
