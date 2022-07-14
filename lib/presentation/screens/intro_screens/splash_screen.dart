import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/presentation/screens/intro_screens/signup_screen.dart';

import '../../../constants/text_styles.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/splash.jpg'),fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: width(20),vertical: height(100)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get Fit',style: bigSplash,),
                  Text("Don't miss the fitness!",style: smallSplash,),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(onTap: (){Get.offAll(const SignupPage());},child: Container(decoration: BoxDecoration(color: const Color(0xFFDE5454),borderRadius: BorderRadius.circular(20)),height: screenHeight*0.07,width: screenWidth*0.5,child: Center(child: Text('Create Account',style: buttonText,)))),
                      TextButton(onPressed: (){Get.offAll(const LoginPage());}, child: Text('Log In',style: splashLogin,)),
                    ],
                  )
                ],
              )),
        ),
      )
    );
  }
}
