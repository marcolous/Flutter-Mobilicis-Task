import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/view/home/widgets/filter_bottom_sheet.dart';
import 'package:mobilicis_task/view/home/widgets/sort_bottom_sheet.dart';

class FilterSort extends StatelessWidget {
  const FilterSort({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          filterSortItem(
              'Sort', AppImages.sort, () => showSortBottomSheet(context)),
          Gap(10.w),
          filterSortItem('Filters', AppImages.filter,
              () => showFilterBottomSheet(context)),
        ],
      ),
    );
  }

  Widget filterSortItem(
      String title, Widget image, void Function()? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffE0E0E0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
                child: image,
              ),
              Gap(10.w),
              Text(
                title,
                style: AppStyles.style12BlackMedium.copyWith(
                  color: const Color(0xff121212),
                ),
              ),
              Gap(10.w),
              const Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        ),
      ),
    );
  }
}

