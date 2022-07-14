import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';

import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class TricepsScreen extends StatelessWidget {
  final CollectionReference _tri = FirebaseFirestore.instance.collection('tri');
   TricepsScreen({Key? key}) : super(key: key);
  List<String> tri = [
    'assets/excercises/tri/bar tri extrnsion.png',
    'assets/excercises/tri/close grib bench press.png',
    'assets/excercises/tri/dumbell triceps.png',
    'assets/excercises/tri/one arm dumbell rticeps extensions.png',
    'assets/excercises/tri/One Arm Reverse pulldown.png',
    'assets/excercises/tri/push downs.png',
    'assets/excercises/tri/triceps dips.png',
    'assets/excercises/tri/triceps extesions.png',
    'assets/excercises/tri/triceps kickbacks.png',
    'assets/excercises/tri/triceps pushdown.png',
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
                'Triceps',
                style: widgetTitle,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _tri.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return ExcricesCard(
                      name: '${documentSnapshot['name']}',
                      ex: 'tri',
                      img: tri[index],
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
