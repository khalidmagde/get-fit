import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';

import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class ShouldersScreen extends StatelessWidget {
  final CollectionReference _shoulders = FirebaseFirestore.instance.collection('shoulders');
   ShouldersScreen({Key? key}) : super(key: key);
  List<String> shoulders = [
    'assets/excercises/shoulders/Barbell Front Raises.png',
    'assets/excercises/shoulders/Dulubbell Lateral Raise With Arts Bent.png',
    'assets/excercises/shoulders/dumbbell rear dwltoid reaises.png',
    'assets/excercises/shoulders/Front Raises.png',
    'assets/excercises/shoulders/Low Pulley Bent-Over.png',
    'assets/excercises/shoulders/Low Pulley Frohit Ralses.png',
    'assets/excercises/shoulders/Pec Deck Rear-Deit.png',
    'assets/excercises/shoulders/Upright Row.png',
    'assets/excercises/shoulders/upright rows.png',
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
                'Shoulders',
                style: widgetTitle,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _shoulders.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return ExcricesCard(
                      name: '${documentSnapshot['name']}',
                      ex: 'shoulders',
                      img: shoulders[index],
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
