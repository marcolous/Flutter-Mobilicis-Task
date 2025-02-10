import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

class HomeTitleText extends StatelessWidget {
  const HomeTitleText(
      {super.key, required this.title1, this.title2, this.showIcon = false});
  final String title1;
  final String? title2;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: title1, style: AppStyles.style18DarkGreyRegular),
                TextSpan(
                    text: title2,
                    style: AppStyles.style14GreyRegular
                        .copyWith(color: const Color(0xff3F3E8F))),
              ],
            ),
          ),
          const Expanded(child: Gap(1)),
          if (showIcon)
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20.sp,
              color: const Color(0xff525252),
            ),
        ],
      ),
    );
  }
}
