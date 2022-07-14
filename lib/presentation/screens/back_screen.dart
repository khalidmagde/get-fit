import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class BackScreen extends StatelessWidget {
  final CollectionReference _back = FirebaseFirestore.instance.collection('back');
   BackScreen({Key? key}) : super(key: key);
  List<String> back = [
    'assets/excercises/Back/back extensiond.png',
    'assets/excercises/Back/barbell shrugs.png',
    'assets/excercises/Back/bent over row.png',
    'assets/excercises/Back/chin-ups.png',
    'assets/excercises/Back/deadlifts.png',
    'assets/excercises/Back/lat pull-downs.png',
    'assets/excercises/Back/one-arm dumbbell rows.png',
    'assets/excercises/Back/reverse chin ups.png',
    'assets/excercises/Back/seated rows.png',
    'assets/excercises/Back/t-bar bent over row.png',
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
                'Back',
                style: widgetTitle,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _back.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return ExcricesCard(
                      name: '${documentSnapshot['name']}',
                      ex: 'back',
                      img: back[index],
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
