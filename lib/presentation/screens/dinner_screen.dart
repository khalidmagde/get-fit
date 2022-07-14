import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/text_styles.dart';
import '../widgets/slidpanel.dart';

class DinnerScreen extends StatefulWidget {
  const DinnerScreen({Key? key}) : super(key: key);

  @override
  State<DinnerScreen> createState() => _DinnerScreenState();
}

class _DinnerScreenState extends State<DinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.red,),onPressed: (){Get.back();}),
        title: Text('Dinner',style: TextStyle(color:Colors.black),),
        centerTitle: true,
      ),
      body: PanelDetails(image: 'assets/images/dinnerr.png'),
    );
  }
}
