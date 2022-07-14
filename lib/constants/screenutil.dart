import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

double screenWidth = MediaQuery.of(Get.context!).size.width;
double screenHeight = MediaQuery.of(Get.context!).size.height;

height(double height) {
  return ScreenUtil().setHeight(height);
}

width(double width) {
  return ScreenUtil().setWidth(width);
}

radius(double radius) {
  return ScreenUtil().radius(radius);
}

sp(double sp) {
  //font size
  return ScreenUtil().setSp(sp);
}
