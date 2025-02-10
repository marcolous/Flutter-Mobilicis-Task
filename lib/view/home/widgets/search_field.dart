import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          style: AppStyles.style16DarkGreyRegular,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Container(
              padding: EdgeInsets.all(14.w),
              height: 12,
              width: 12,
              child: Center(child: AppImages.search),
            ),
            suffixIcon: Container(
              padding: EdgeInsets.all(10.w),
              height: 12,
              width: 12,
              child: Center(child: AppImages.mic),
            ),
            hintText: 'Search phones with make, model...',
            hintStyle: AppStyles.style16DarkGreyRegular,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: borderDecoration(),
            enabledBorder: borderDecoration(),
          ),
        ),
      ),
    );
  }

  InputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        color: Color(0xffE0E0E0),
        width: 1,
      ),
    );
  }
}
