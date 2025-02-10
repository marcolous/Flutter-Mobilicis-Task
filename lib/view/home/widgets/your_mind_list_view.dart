import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

class YourMindListView extends StatelessWidget {
  const YourMindListView({super.key});
  static final yourMindList = [
    {'image': AppImages.img1, 'title': 'Buy Used Phones'},
    {'image': AppImages.img2, 'title': 'Sell Used Phones'},
    {'image': AppImages.img3, 'title': 'Compare Prices'},
    {'image': AppImages.img4, 'title': 'My Profile'},
    {'image': AppImages.img5, 'title': 'My Listings'},
    {'image': AppImages.img6, 'title': 'Open Store'},
    {'image': AppImages.img7, 'title': 'Services'},
    {'image': AppImages.img8, 'title': 'Device Health  Check'},
    {'image': AppImages.img9, 'title': 'Battery Health Check'},
    {'image': AppImages.img10, 'title': 'IMEI Verification'},
    {'image': AppImages.img11, 'title': 'Device Details'},
    {'image': AppImages.img12, 'title': 'Data Wipe'},
    {'image': AppImages.img13, 'title': 'Under Warranty Phones'},
    {'image': AppImages.img14, 'title': 'Premium Phones'},
    {'image': AppImages.img15, 'title': 'Like New Phones'},
    {'image': AppImages.img16, 'title': 'Refurbished Phones'},
    {'image': AppImages.img17, 'title': 'Verified Phones'},
    {'image': AppImages.img18, 'title': 'My Negotiations'},
    {'image': AppImages.img19, 'title': 'My Favourites'},
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: 80.w,
          child: Column(
            children: [
              yourMindList[index]['image'] as Widget,
              Text(
                yourMindList[index]['title'].toString(),
                style: AppStyles.style12BlackRegular,
                maxLines: 2,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) => Gap(5.w),
        itemCount: yourMindList.length,
      ),
    );
  }
}