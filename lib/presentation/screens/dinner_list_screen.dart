import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/screenutil.dart';
import '../../constants/space.dart';
import '../../constants/text_styles.dart';
import '../widgets/meals_card.dart';
import '../widgets/search_bar.dart';
class DinnerList extends StatelessWidget {
   DinnerList({Key? key}) : super(key: key);
  final CollectionReference _dinner =
  FirebaseFirestore.instance.collection('dinner');
   List<String> dinner=[
     'assets/recipes_image/Crispy Tofu _ Teriyaki Noodles .jpg',
     'assets/recipes_image/One-Tray Cashew Chicken.jpg',
     'assets/recipes_image/Harissa Chicken and Moroccan Couscous Meal Prep.jpeg',
     'assets/recipes_image/Chicken, Sweet Potato _ Green Beans.jpg',
     'assets/recipes_image/teriyaki beef meal.jpg',
     'assets/recipes_image/Fish _ Rice Recipes.jpg',
     'assets/recipes_image/New York Baked Protein Cheesecake.jpg',
     'assets/recipes_image/Acai Berry and Chia Pudding Recipe.jpg',
     'assets/recipes_image/Asian Peanut Butter Sesame Chicken.jpg',
     'assets/recipes_image/High-Protein Banana Split.jpg',
     'assets/recipes_image/Creamy Lemon _ Thyme Chicken.jpg',
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
                'Dinner',
                style: widgetTitle2,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _dinner.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return MealsCard(
                      image: dinner[index],
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
        // Expanded(
        //   child: ListView.builder(
        //       itemCount: 10,
        //       itemBuilder: (context, index) {
        //         return const MealsCard(image: 'assets/images/bell_pepper.png',title: 'Bell Pepper Chicken Stir Fry',calories: '320 cal',time: '18 min cook time',);
        //       }),
        // )
      ]),
    );
  }
}
