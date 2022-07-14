import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';

import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class BicepsScreen extends StatelessWidget {
  final CollectionReference _bicebs = FirebaseFirestore.instance.collection('bicebs');
   BicepsScreen({Key? key}) : super(key: key);
  List<String> bicebs = [
    'assets/excercises/Bicebs/Barbell Curls.png',
    'assets/excercises/Bicebs/Cable Biceps Curl.png',
    'assets/excercises/Bicebs/concentration curls.png',
    'assets/excercises/Bicebs/curls.png',
    'assets/excercises/Bicebs/Dumbbell Biceps Curl.png',
    'assets/excercises/Bicebs/Hammer Curls.png',
    'assets/excercises/Bicebs/Low Pulley Curls.png',
    'assets/excercises/Bicebs/Preacher Curls.png',
    'assets/excercises/Bicebs/Reverse Curls.png',
    'assets/excercises/Bicebs/seated curl.png',
  ];

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
                'Biceps',
                style: widgetTitle,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _bicebs.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return ExcricesCard(
                      name: '${documentSnapshot['name']}',
                      ex: 'bicebs',
                      img: bicebs[index],
                      colorDivider: Colors.black,
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ]),
    );
  }
}
