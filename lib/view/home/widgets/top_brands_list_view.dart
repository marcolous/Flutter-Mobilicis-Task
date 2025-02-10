import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';

class TopBrandsListView extends StatelessWidget {
  const TopBrandsListView({super.key});
  static final topBrandsList = [
    AppImages.apple,
    AppImages.mi,
    AppImages.samsung,
    AppImages.vivo,
    AppImages.realme,
    AppImages.m,
    AppImages.oppo,
    AppImages.viewAll,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => topBrandsList[index],
        separatorBuilder: (context, index) => Gap(17.w),
        itemCount: topBrandsList.length,
      ),
    );
  }
}