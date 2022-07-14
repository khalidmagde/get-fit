import 'package:flutter/material.dart';
import 'package:get_fit/constants/screenutil.dart';

import '../../constants/space.dart';
import '../../constants/text_styles.dart';

class ExcricesCard extends StatelessWidget {
  ExcricesCard({
    Key? key,
    required this.name,
    required this.img,
    required this.ex,
    required this.colorDivider,
    // required this.url
  });
  final String name;
  final String img;
  final String ex;
  final Color colorDivider;
  // final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width(10),vertical: 20),
      width: screenWidth,
      // height: height(100),
      //color: Colors.red,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(img,height: height(90),),
          const Space(boxWidth: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width(40),child: Divider(thickness: 4,color: colorDivider,),),
              Text(name,style:widgetTitle),
              Container(
                width: width(80),
                height: height(40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF707070).withOpacity(0.3) ),
                child: Text(
                  ex,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent),elevation: MaterialStateProperty.all(0)),
                  // elevation: 0.0,
                  // backgroundColor: Colors.white,
                  onPressed: () {},
                  child: const Icon(
                    Icons.play_circle,
                    color: Colors.black,
                  ),
                ),
                const Space(boxWidth: 15,),
                const Icon(Icons.thumb_up),
              ],
            ),
          )
        ],
      ),
    );
  }
}


/* img: 'images/Bench.jpg',
            name: 'Bench Presses',
            ex: 'Chest', */





/* Container TrainBuilder(String name, String img, String ex) {
  return Container(
    width: double.infinity,
    height: 100,
    color: Colors.red,
    child: Row(
      children: [
        /*Image*/ Container(
          width: 111,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.none),
              borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(50),
                  // bottomRight: Radius.circular(50)
                  )),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$name'),
            ElevatedButton(onPressed: () {}, child: Text('$ex')),
          ],
        ),
        SizedBox(
          width: 60,
        ),
        FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.play_circle),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.thumb_up)
      ],
    ),
  ); */

