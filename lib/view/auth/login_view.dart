import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/widgets/app_button.dart';
import 'package:mobilicis_task/utils/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  static const route = 'login';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(firstScreen: true),
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
                'Sign in to continue',
                style: AppStyles.style14GreyRegular,
              ),
              Gap(100.h),
              const CustomTextField(
                title: 'Enter Your Phone Number',
                hintText: 'Mobile Number',
                isPhone: true,
              ),
              Gap(100.h),
              const TermsAndConditions(),
              AppButton(
                title: 'Next',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          side: const BorderSide(
            width: 1,
            color: Color(0xffABABAB),
          ),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        RichText(
          text: TextSpan(
            text: 'Accept ',
            style: AppStyles.style14GreyRegular,
            children: [
              TextSpan(
                text: 'Terms and Conditions',
                style: AppStyles.style14GreyRegular.copyWith(
                  color: const Color(0xff3E468F),
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
