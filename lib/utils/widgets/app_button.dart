import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.showIcon = true,
    required this.title,
  });
  final void Function()? onPressed;
  final bool showIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            backgroundColor: const Color(0xff3F3E8F),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppStyles.style18WhiteSemiBold,
                ),
                Gap(10.w),
                showIcon
                    ? const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    : const SizedBox(),
              ],
            ),
          )),
    );
  }
}
