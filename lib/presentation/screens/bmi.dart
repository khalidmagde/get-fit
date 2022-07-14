import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import 'package:get_fit/presentation/screens/result_screen.dart';

import '../../constants/text_styles.dart';
import '../widgets/main_button.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale = true;
  late double heightVal;
  late int age;
  late int weight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            'BMI / BMR',
            style: titlePage,
          ),
          leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_outlined),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Container(
              decoration: const BoxDecoration(color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/images/bmi.jpg'),opacity: 0.75, fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(150),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight*0.64,
              child: Column(
                children: [
                  Row( mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.transgender_outlined,
                      ),
                      const Space(boxWidth: 10,),
                      Text(
                        "Gender",
                        style: seeAll
                      ),
                    ],
                  ),
                  const Space(boxHeight: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      humanBuilder('male'),
                      humanBuilder('female'),
                    ],
                  ),
                  const Space(boxHeight: 35,),
                  Row(
                    children: [
                      const Icon(
                        Icons.balance,
                      ),
                      const Space(boxWidth: 10,),
                      Text(
                        "Weight",
                        style: seeAll
                      ),
                      SizedBox(
                        width: width(110),
                      ),
                      const Icon(
                        Icons.height_outlined,
                      ),
                      const Space(boxWidth: 10,),
                      Text(
                        "Height",
                        style: seeAll
                      ),
                    ],
                  ),
                  const Space(boxHeight: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textBuilder('Kg'),
                      textBuilder('Cm')
                    ],
                  ),
                  const Space(boxHeight: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                      ),
                      const Space(boxWidth: 10,),
                      Text("Age",style: seeAll,),
                    ],
                  ),
                  const Space(boxHeight: 15,),
                  textBuilder('years'),
                ],
              ),
            ),
            const Spacer(),
            MainButton(onPressed: (){
              var result = weight / pow(heightVal / 100, 2);
              print(result);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Result(result: result, isMale: isMale, age: age)));
            },text: 'Calculate',),
          ],
        ),
      ),
    );
  }
  Material humanBuilder(String type) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: GestureDetector(
        onTap: () => setState(() => isMale = (type == 'male') ? true : false),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          width: screenWidth*0.4,
          height: height(110),
          decoration: BoxDecoration(
              color:(isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.blueGrey
                  : Colors.white.withOpacity(0.9),
            // color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 35,
              ),
              Text(
                type,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Expanded m1Exp(BuildContext context, String type) {
  //   return Expanded(
  //       child: GestureDetector(
  //         onTap: () => setState(() => isMale = (type == 'male') ? true : false),
  //         child: Container(
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(10.0),
  //               color: (isMale && type == 'male') || (!isMale && type == 'female')
  //                   ? Colors.teal
  //                   : Colors.blueGrey),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Icon(
  //                 type == 'male' ? Icons.male : Icons.female,
  //                 size: 90,
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               Text(
  //                 type == 'male' ? "Male" : "Female",
  //                 style: Theme.of(context).textTheme.headline2,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  Material textBuilder(String suffix) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
        width: screenWidth*0.4,
        height: height(110),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10),),
        child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixText: suffix,
            )),
      ),
    );
  }
}
