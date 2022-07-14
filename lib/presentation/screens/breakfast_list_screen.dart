import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/screenutil.dart';
import '../../constants/space.dart';
import '../../constants/text_styles.dart';
import '../widgets/meals_card.dart';
import '../widgets/search_bar.dart';

class BreakfastList extends StatelessWidget {
  final CollectionReference _breakfast =
  FirebaseFirestore.instance.collection('breakfast');
   BreakfastList({Key? key}) : super(key: key);
   List<String> breakFast=[
     'assets/recipes_image/Banana+Pancakes .jpg',
     'assets/recipes_image/Chicken+Omelette.jpg',
     'assets/recipes_image/Smashed+Chickpea+and+Avocado+Toast.jpg',
     'assets/recipes_image/Greek+Yogurt+with+Nuts,+and+Berries.jpg',
     'assets/recipes_image/Eggs+and+Avocado+Toast.jpg',
     'assets/recipes_image/Coconut+Coffee+Buzz+Smoothie.jpg',
     'assets/recipes_image/Chocolate,+PB+and+Berry+Smoothie.jpg',
     'assets/recipes_image/Tomato _ Zucchini Frittata.jpg',
     'assets/recipes_image/cocoa-chia-pudding-with-raspberries.jpg',
     'assets/recipes_image/Blueberry Almond Chia Pudding.jpg'
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
                'Breakfast',
                style: widgetTitle2,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _breakfast.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return MealsCard(
                                    image: breakFast[index],
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
        //   child: StreamBuilder(
        //     stream: _products.snapshots(),
        //     builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        //       if (streamSnapshot.hasData) {
        //         return ListView.builder(
        //           itemCount: streamSnapshot.data!.docs.length,
        //           itemBuilder: (context, index) {
        //             final DocumentSnapshot documentSnapshot =
        //                 streamSnapshot.data!.docs[index];
        //             return MealsCard(
        //               image: 'assets/images/berry.png',
        //               title: '${documentSnapshot['name']}',
        //               calories: '${documentSnapshot['recipe'].toString()}',
        //               time: '5 min cook time',
        //             );
        //             // return Card(
        //             //   margin: const EdgeInsets.all(10),
        //             //   child: ListTile(
        //             //     title: Text(documentSnapshot['name']),
        //             //     subtitle: Text(documentSnapshot['price'].toString()),
        //             //   ),
        //             // );
        //           },
        //         );
        //       }
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     },
        //   ),
        //   Expanded(
        //     child: ListView.builder(
        //         itemCount: 10,
        //         itemBuilder: (context, index) {
        //           return const MealsCard(image: 'assets/images/berry.png',title: 'Berry Parfait',calories: '399 cal',time: '5 min cook time',);
        //         }),
        //   ),
      ]),
    );
  }
}
