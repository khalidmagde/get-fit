import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/presentation/screens/recipes_screen.dart';
import 'package:get_fit/presentation/screens/workout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/space.dart';
import '../../constants/text_styles.dart';
import '../widgets/card_home.dart';
import 'bmi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Uri toLaunch = Uri(scheme: 'https', host: 'gett-fitt.000webhostapp.com', path: '/index.html');
  Future<void>? _launched;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [const CircleAvatar(backgroundColor: Colors.white,radius: 17,child: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png',),radius: 16),),const Space(boxWidth: 125,),Text('Get Fit',style: titlePage,),]),
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(height(120)),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.symmetric(vertical: 30,),
          crossAxisSpacing: width(10),
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: <Widget>[
            CardHome(image: 'assets/images/bmi-bmr.png', title: 'BMI / BMR',color: Colors.black, onTap: (){Get.to(const BMI());},),
            CardHome(image: 'assets/images/workout.png', title: 'Workout',color: Colors.black, onTap: (){Get.to(const WorkoutScreen());},),
            CardHome(image: 'assets/images/recipes.png', title: 'Recipes',color: Colors.black, onTap: (){Get.to(RecipesScreen());},),
            CardHome(image: 'assets/images/find_calories.png', title: 'Find Calories',color: Colors.black, onTap: (){ setState(() {
              _launched = _launchInBrowser(toLaunch);
            });},),
            CardHome(image: 'assets/images/fav.png', title: 'Fav workout',color: Colors.black, onTap: (){},),
            CardHome(image: 'assets/images/fav.png', title: 'Fav Recipes',color: Colors.black, onTap: (){},),
          ],
        ),
      ),
    );
  }
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}