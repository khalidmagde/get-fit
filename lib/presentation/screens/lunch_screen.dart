import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/text_styles.dart';
import '../widgets/slidpanel.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.red,),onPressed: (){Get.back();}),
        title: Text('Lunch',style: TextStyle(color:Colors.black),),
        centerTitle: true,
      ),
      body: PanelDetails(image: 'assets/images/lunchh.png',),
    );
  }
}
