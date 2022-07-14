import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/presentation/screens/back_screen.dart';
import 'package:get_fit/presentation/screens/calf_screen.dart';
import 'package:get_fit/presentation/screens/chest_screen.dart';
import 'package:get_fit/presentation/screens/forearms_screen.dart';
import 'package:get_fit/presentation/screens/legs_screen.dart';
import 'package:get_fit/presentation/screens/shoulders_screen.dart';
import 'package:get_fit/presentation/screens/triceps_screen.dart';
import '../../constants/text_styles.dart';
import '../widgets/card_home.dart';
import 'abs_screen.dart';
import 'biceps_screen.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            'Workout',
            style: titlePage,
          ),
          leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios_outlined),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Container(
              decoration: const BoxDecoration(color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage('assets/images/imageBar.jpg'),opacity: 0.75, fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(150),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        crossAxisSpacing: width(10),
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          CardHome(
            image: 'assets/images/chest.png',
            title: 'Chest',
            color: Colors.red,
            onTap: () {Get.to(ChestScreen());},
          ),
          CardHome(
            image: 'assets/images/abs.png',
            title: 'Abs',
            color: Colors.red,
            onTap: () {Get.to(AbsScreen());},
          ),
          CardHome(
            image: 'assets/images/biceps.png',
            title: 'Biceps',
            color: Colors.red,
            onTap: () {Get.to(BicepsScreen());},
          ),
          CardHome(
            image: 'assets/images/triceps.png',
            title: 'Triceps',
            color: Colors.red,
            onTap: () {Get.to(TricepsScreen());},
          ),
          CardHome(
            image: 'assets/images/shoulders.png',
            title: 'Shoulders',
            color: Colors.red,
            onTap: () {Get.to(ShouldersScreen());},
          ),
          CardHome(
            image: 'assets/images/forearms.png',
            title: 'Forearms',
            color: Colors.red,
            onTap: () {Get.to(ForearmsScreen());},
          ),
          CardHome(
            image: 'assets/images/back.png',
            title: 'Back',
            color: Colors.red,
            onTap: () {Get.to(BackScreen());},
          ),
          CardHome(
            image: 'assets/images/calf.png',
            title: 'Calf',
            color: Colors.red,
            onTap: () {Get.to(CalfScreen());},
          ),
          CardHome(
            image: 'assets/images/legs.png',
            title: 'Legs',
            color: Colors.red,
            onTap: () {Get.to(LegsScreen());},
          ),
        ],
      ),
    );
  }
}
