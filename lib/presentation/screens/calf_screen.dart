import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class CalfScreen extends StatelessWidget {
  const CalfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
        actions: const [
          Center(
            child: SearchBar(),
          )
        ],
      ),
      body: Column(children: [
        const Space(
          boxHeight: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: height(40),
          width: screenWidth,
          color: const Color(0xFF707070).withOpacity(0.3),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Calf',
                style: widgetTitle,
              )),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ExcricesCard(
                  name: ' Calf Jump',
                  ex: 'Calf',
                  img: 'assets/images/calf1.png',
                  colorDivider: const Color(0xFFC0D1E8),
                );
              }),
        )
      ]),
    );
  }
}
