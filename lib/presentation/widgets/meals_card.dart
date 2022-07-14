import 'package:flutter/material.dart';

import '../../constants/screenutil.dart';
import '../../constants/text_styles.dart';

class MealsCard extends StatelessWidget {
  const MealsCard({Key? key, this.title, this.time, this.calories, this.image})
      : super(key: key);
  final String? title, image;
  final int? time, calories;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.symmetric(horizontal: width(15), vertical: height(10)),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: height(120),
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:
                  DecorationImage(
                      image: AssetImage(image!), fit: BoxFit.fill)
              ),
            ),
            Positioned(
                left: width(120),
                child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                    elevation: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      height: height(100),
                      width: screenWidth * 0.65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: widgetTitle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${time!} min cook time',
                                style: labelTextField,
                              ),
                              Text(
                                '${calories!} calories',
                                style: labelTextField,
                              ),
                            ],
                          )
                        ],
                      ),
                    )))
          ],
        ));
  }
}
