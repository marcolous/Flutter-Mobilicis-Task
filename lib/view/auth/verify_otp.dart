import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/widgets/app_button.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatefulWidget {
  static const route = 'verifyOTP';
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController pinController = TextEditingController();
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
                'Verify Mobile No.',
                style: AppStyles.style28PurpleSemiBold,
              ),
              Text.rich(
                TextSpan(
                  text:
                      'Please enter the 4 digital verification code sent to your mobile number ',
                  style: AppStyles.style14GreyRegular,
                  children: [
                    TextSpan(
                      text: '+91-7587329682',
                      style: AppStyles.style14DarkGreySemiBold,
                    ),
                    TextSpan(
                      text: ' via ',
                      style: AppStyles.style14GreyRegular,
                    ),
                    TextSpan(
                      text: 'SMS',
                      style: AppStyles.style14DarkGreySemiBold,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Gap(100.h),
              CustomPinPut(pinController: pinController),
              Gap(60.h),
              Text(
                'Didn’t receive OTP?',
                style: AppStyles.style14GreyRegular,
              ),
              ResendOtpWidget(
                onResend: () {},
              ),
              Gap(100.h),
              AppButton(
                title: 'Verify OTP',
                showIcon: false,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({super.key, required this.pinController, this.validator});
  final String? Function(String?)? validator;

  final TextEditingController pinController;

  static const focusedBorderColor = Color(0xffCCCCCC);
  static const fillColor = Color.fromRGBO(243, 246, 249, 0);
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: borderColor),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      validator: validator,
      separatorBuilder: (index) => SizedBox(width: 20.w),
      controller: pinController,
      autofocus: true,
      defaultPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}

class ResendOtpWidget extends StatelessWidget {
  final VoidCallback onResend;

  const ResendOtpWidget({super.key, required this.onResend});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Resend OTP',
        style: const TextStyle(
          color: Color(0xff191919),
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()..onTap = onResend,
        children: const [
          TextSpan(
            text: ' in 0:23 Sec',
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
