import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';
import 'package:mobilicis_task/utils/widgets/app_button.dart';
import 'package:mobilicis_task/utils/widgets/custom_text_field.dart';

class AccountNotFound extends StatelessWidget {
  static const route = 'accountNotFound';
  const AccountNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(50.h),
              SizedBox(
                width: 160.w,
                height: 60.h,
                child: AppImages.logo,
              ),
              Gap(60.h),
              Text(
                'Welcome',
                style: AppStyles.style28PurpleSemiBold,
              ),
              Text(
                'SignUp to continue',
                style: AppStyles.style14GreyRegular,
              ),
              Gap(100.h),
              const CustomTextField(
                title: 'Please Tell Us Your Name ',
                hintText: 'Name',
                hasAst: true,
              ),
              Gap(100.h),
              AppButton(
                title: 'Confirm Name',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
