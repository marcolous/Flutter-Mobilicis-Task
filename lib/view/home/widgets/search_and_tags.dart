import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/view/home/widgets/search_field.dart';

class SearchAndTags extends StatelessWidget {
  const SearchAndTags({super.key});
  static List<Map<String, dynamic>> titles = [
    {'title': 'Sell Used Phones', 'isNew': false},
    {'title': 'Buy Used Phones', 'isNew': false},
    {'title': 'Compare Prices', 'isNew': false},
    {'title': 'My Profile', 'isNew': false},
    {'title': 'My Listings', 'isNew': false},
    {'title': 'Services', 'isNew': false},
    {'title': 'Register your Store', 'isNew': true},
    {'title': 'Get the App', 'isNew': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchField(),
        Gap(10.h),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => OptionItem(
              title: titles[index]['title'],
              isNew: titles[index]['isNew'],
            ),
            separatorBuilder: (context, index) => Gap(8.w),
            itemCount: titles.length,
          ),
        )
      ],
    );
  }
}

class OptionItem extends StatelessWidget {
  const OptionItem({super.key, required this.title, this.isNew = false});
  final String title;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffE0E0E0),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
          child: Row(
        children: [
          if (isNew) AppImages.isNew,
          if (isNew) Gap(10.w),
          Text(
            title,
            style: AppStyles.style12BlackMedium.copyWith(
              color: const Color(0xff121212),
            ),
          ),
        ],
      )),
    );
  }
}
