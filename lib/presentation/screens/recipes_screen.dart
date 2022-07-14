import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import 'package:get_fit/presentation/screens/breakfast_screen.dart';
import 'package:get_fit/presentation/screens/dinner_screen.dart';
import 'package:get_fit/presentation/screens/lunch_screen.dart';
import 'package:get_fit/presentation/screens/snack_list_screen.dart';
import 'package:get_fit/presentation/screens/snack_screen.dart';
import '../../constants/text_styles.dart';
import '../widgets/recipes_card.dart';
import 'breakfast_list_screen.dart';
import 'dinner_list_screen.dart';
import 'lunch_list_screen.dart';

class RecipesScreen extends StatelessWidget {
  final CollectionReference _breakfast =
  FirebaseFirestore.instance.collection('breakfast');

  final CollectionReference _lunch =
  FirebaseFirestore.instance.collection('lunch');

  final CollectionReference _dinner =
  FirebaseFirestore.instance.collection('dinner');

  final CollectionReference _snacks =
  FirebaseFirestore.instance.collection('snacks');

  RecipesScreen({Key? key}) : super(key: key);
  List<String> breakFast = [
    'assets/recipes_image/Banana+Pancakes .jpg',
    'assets/recipes_image/Chicken+Omelette.jpg',
    'assets/recipes_image/Smashed+Chickpea+and+Avocado+Toast.jpg',
    'assets/recipes_image/Greek+Yogurt+with+Nuts,+and+Berries.jpg',
    'assets/recipes_image/Eggs+and+Avocado+Toast.jpg',
  ];
  List<String> lunch = [
    'assets/recipes_image/Spinach _ Mushroom Quiche.jpg',
    'assets/recipes_image/Sheet-Pan Garlic-Soy Chicken _ Vegetables.png',
    'assets/recipes_image/Skillet Lemon Chicken _ Potatoes with Kale.jpg',
    'assets/recipes_image/Tandoori Chicken Kebabs.jpg',
    'assets/recipes_image/Roast Chicken Dal.jpg',
  ];
  List<String> dinner = [
    'assets/recipes_image/Crispy Tofu _ Teriyaki Noodles .jpg',
    'assets/recipes_image/One-Tray Cashew Chicken.jpg',
    'assets/recipes_image/Harissa Chicken and Moroccan Couscous Meal Prep.jpeg',
    'assets/recipes_image/Chicken, Sweet Potato _ Green Beans.jpg',
    'assets/recipes_image/teriyaki beef meal.jpg',
  ];
  List<String> snacks = [
    'assets/recipes_image/Banana+Pancakes .jpg',
    'assets/recipes_image/Chicken+Omelette.jpg',
    'assets/recipes_image/Smashed+Chickpea+and+Avocado+Toast.jpg',
    'assets/recipes_image/Greek+Yogurt+with+Nuts,+and+Berries.jpg',
    'assets/recipes_image/Eggs+and+Avocado+Toast.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            'Recipes',
            style: titlePage,
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/images/recipes_home.png'),
                      opacity: 0.75,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(150),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'Breakfast Recipes',
                  style: widgetTitle,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Get.to(BreakfastList());
                    },
                    child: Text(
                      'See All',
                      style: seeAll,
                    ))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth, height: 145,
            child: StreamBuilder(
              stream: _breakfast.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      return RecipesCard(
                        calories: documentSnapshot['calories'],
                        title:'${documentSnapshot['name']}',
                        img: breakFast[index],
                        navigate: ()=>BreakFastScreen(),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'lunch Recipes',
                  style: widgetTitle,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Get.to(LunchList());
                    },
                    child: Text(
                      'See All',
                      style: seeAll,
                    ))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth, height: 145,
            child: StreamBuilder(
              stream: _lunch.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      return RecipesCard(
                        calories: documentSnapshot['calories'],
                        title:'${documentSnapshot['name']}',
                        img: lunch[index],
                        navigate: ()=>LunchScreen(),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'Dinner Recipes',
                  style: widgetTitle,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Get.to(DinnerList());
                    },
                    child: Text(
                      'See All',
                      style: seeAll,
                    ))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth, height: 145,
            child: StreamBuilder(
              stream: _dinner.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      return RecipesCard(
                        calories: documentSnapshot['calories'],
                        title:'${documentSnapshot['name']}',
                        img: dinner[index],
                        navigate: ()=>DinnerScreen(),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  'Snack Recipes',
                  style: widgetTitle,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Get.to(SnackList());
                    },
                    child: Text(
                      'See All',
                      style: seeAll,
                    ))
              ],
            ),
          ),
          SizedBox(
            // margin: EdgeInsets.only(top: 0,bottom: 15),
            width: screenWidth, height: 145,
            child: StreamBuilder(
              stream: _snacks.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      return RecipesCard(
                        calories: documentSnapshot['calories'],
                        title:'${documentSnapshot['name']}',
                        img: snacks[index],
                        navigate: ()=>SnackScreen(),
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
          Space(boxHeight: 15,)
        ],
      ),
    );
  }
}
