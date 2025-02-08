import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static const fontFamily = 'Poppins';
   static TextStyle style12BlackRegular = TextStyle(
    color: const Color(0xff282828),
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static TextStyle style14GreyRegular = TextStyle(
    color: const Color(0xff707070),
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static TextStyle style16LightGreyRegular = TextStyle(
    color: const Color(0xffCCCCCC),
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  static TextStyle style16DarkGreyRegular = TextStyle(
    color: const Color(0xff757474),
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

   static TextStyle style18WhiteSemiBold = TextStyle(
    color: const Color(0xffFFFFFF),
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );

  static TextStyle style28PurpleSemiBold = TextStyle(
    color: const Color(0xff3F3E8F),
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
}
