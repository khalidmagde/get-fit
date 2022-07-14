import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';

import '../../constants/text_styles.dart';
import '../widgets/excersices_card.dart';
import '../widgets/search_bar.dart';

class ChestScreen extends StatelessWidget {
  final CollectionReference _chest =
  FirebaseFirestore.instance.collection('chest');
   ChestScreen({Key? key}) : super(key: key);
  List<String> chest=[
    'assets/excercises/Chest pics/bench press.jpg',
    'assets/excercises/Chest pics/Cable Crossover Flys.png',
    'assets/excercises/Chest pics/Dive Bomber Pushup.png',
    'assets/excercises/Chest pics/Dumbbell Fly.png',
    'assets/excercises/Chest pics/Dumbbell Pushup.png',
    'assets/excercises/Chest pics/Parallel Bar Dips.png',
    'assets/excercises/Chest pics/Pec Deck Flies.png',
    'assets/excercises/Chest pics/Push-Ups.png',
    'assets/excercises/Chest pics/Single Arm Pushup.png',
    'assets/excercises/Chest pics/Stability Ball Pushup.png',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),),
        actions: const [Center(child: SearchBar(),)],
      ),
      body: Column(
          children: [
            const Space(boxHeight: 15,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: height(40),width: screenWidth,
        color: const Color(0xFF707070).withOpacity(0.3),
        child: Container(alignment: Alignment.centerLeft,child: Text('Chest',style: widgetTitle,)),
        ),
            Expanded(
              child: StreamBuilder(
                stream: _chest.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data!.docs[index];
                        return ExcricesCard(name: '${documentSnapshot['name']}',ex: 'Chest',img: chest[index], colorDivider: Colors.black,);
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
