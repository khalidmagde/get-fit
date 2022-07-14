import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/slidpanel.dart';

class BreakFastScreen extends StatefulWidget {
  const BreakFastScreen({Key? key}) : super(key: key);

  @override
  State<BreakFastScreen> createState() => _BreakFastScreenState();
}

class _BreakFastScreenState extends State<BreakFastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.red,),onPressed: (){Get.back();}),
        title: Text('Breakfast',style: TextStyle(color:Colors.black),),
        centerTitle: true,
      ),
      body: PanelDetails(image: 'assets/images/yogurt-with-mixed-berries.png'),
    );
  }
}
