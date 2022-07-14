import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/screenutil.dart';
import '../../constants/space.dart';
import '../../constants/text_styles.dart';
import '../widgets/meals_card.dart';
import '../widgets/search_bar.dart';
class LunchList extends StatelessWidget {
  final CollectionReference _lunch =
  FirebaseFirestore.instance.collection('lunch');
   LunchList({Key? key}) : super(key: key);
  List<String> lunch=[
    'assets/recipes_image/Spinach _ Mushroom Quiche.jpg',
    'assets/recipes_image/Sheet-Pan Garlic-Soy Chicken _ Vegetables.png',
    'assets/recipes_image/Skillet Lemon Chicken _ Potatoes with Kale.jpg',
    'assets/recipes_image/Tandoori Chicken Kebabs.jpg',
    'assets/recipes_image/Roast Chicken Dal.jpg',
    'assets/recipes_image/Spicy-Chicken-.jpg',
    'assets/recipes_image/Speedy Harissa Chicken _ Tabbouleh.jpg',
    'assets/recipes_image/Loaf Tin Lasagnejpg.jpg',
    'assets/recipes_image/Chicken Meal Prep.jpg',
    'assets/recipes_image/Homemade Lime _ Chilli Turkey.jpg',
    'assets/recipes_image/BBQ Pulled Chicken Mac N Cheese.jpg',
    'assets/recipes_image/Fajita Pasta Bake.jpg'
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
                'Lunch',
                style: widgetTitle2,
              )),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _lunch.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return MealsCard(
                      image: lunch[index],
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



       /* Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const MealsCard(image: 'assets/images/grill_chicken.png',title: 'Chicken And Mushrooms',calories: '250 cal',time: '18 min cook time',);
              }),
        )*/
      ]),
    );
  }
}
