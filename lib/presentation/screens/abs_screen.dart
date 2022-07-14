import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';

import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class AbsScreen extends StatelessWidget {
  final CollectionReference _abs = FirebaseFirestore.instance.collection('abs');

  AbsScreen({Key? key}) : super(key: key);
  List<String> abs = [
    'assets/excercises/abs/Crunches.png',
    'assets/excercises/abs/Dumbbell Side Bends.png',
    'assets/excercises/abs/Dumbbell Side Bends (2).png',
    'assets/excercises/abs/Flat Bench Lying Leg.png',
    'assets/excercises/abs/hanging leg raises-1.png',
    'assets/excercises/abs/Incline Bench Sit-Up.png',
    'assets/excercises/abs/Leg Raises.png',
    'assets/excercises/abs/Seated Jackknife.png',
    'assets/excercises/abs/Sit-Ups.png',
    'assets/excercises/abs/Twisting Hip Raise.png',
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
                'Abs',
                style: widgetTitle,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _abs.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return ExcricesCard(
                      name: '${documentSnapshot['name']}',
                      ex: 'abs',
                      img: abs[index],
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
