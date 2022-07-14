import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_fit/presentation/screens/intro_screens/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // late Widget home;
  // FirebaseAuth.instance.userChanges().listen((user) {
  //   if (user == null) {
  //     home = const SplashScreen();
  //   } else {
  //     home = const HomeScreen();
  //   }
  // });
  runApp(GetFit());
}

class GetFit extends StatelessWidget {
  GetFit({
    Key? key,
  }) : super(key: key);

  // late Widget home;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => const OverlaySupport(
        child: GetMaterialApp(
          // textDirection: TextDirection.rtl,
          // defaultTransition: Transition.leftToRightWithFade,
          // showPerformanceOverlay: true,
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          title: "Get Fit",
          home: SplashScreen(),
        ),
      ),
    );
  }
}
