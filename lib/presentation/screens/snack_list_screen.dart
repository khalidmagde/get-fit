import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/screenutil.dart';
import '../../constants/space.dart';
import '../../constants/text_styles.dart';
import '../widgets/meals_card.dart';
import '../widgets/search_bar.dart';
class SnackList extends StatelessWidget {
  final CollectionReference _snacks =
  FirebaseFirestore.instance.collection('snacks');
   SnackList({Key? key}) : super(key: key);
  List<String> snacks=[
    'assets/recipes_image/Chicken _ Chorizo Paella.jpg',
    'assets/recipes_image/Healthy Spiced Pumpkin Cake Squares.jpg',
    'assets/recipes_image/Salmon Poke Bowl Recipe.jpg',
    'assets/recipes_image/One-Pot Lentil Dahl.jpg',
    'assets/recipes_image/Vegan Fajitas.jpg',
    'assets/recipes_image/Low Carb Burrito Jars.jpg'
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
          color: const Color(0xFFDE5454),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Snacks',
                style: widgetTitle2,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _snacks.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return MealsCard(
                      image: snacks[index],
                      title: '${documentSnapshot['name']}',
                      calories: documentSnapshot['calories'],
                      // calories: '${documentSnapshot['recipe'].toString()}',
                      time: documentSnapshot['time'],
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


        /*Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const MealsCard(image: 'assets/images/lemon_berry.jpg',title: 'Lemon Berry Crush Smoothie',calories: '95 cal',time: '5 min cook time',);
              }),
        )*/
      ]),
    );
  }
}
