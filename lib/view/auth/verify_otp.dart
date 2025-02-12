import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/services/manager/user_manager.dart';
import 'package:mobilicis_task/services/repo/auth_repo.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/widgets/app_button.dart';
import 'package:mobilicis_task/view/auth/account_not_found.dart';
import 'package:mobilicis_task/view/auth/manager/auth_cubit.dart';
import 'package:mobilicis_task/view/home/home_view.dart';
import 'package:pinput/pinput.dart';

class VerifyOtp extends StatefulWidget {
  static const route = 'verifyOTP';
  const VerifyOtp({super.key, this.isBottomSheet = false});
  final bool isBottomSheet;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late bool isBottomSheet;
  TextEditingController pinController = TextEditingController();
  late AuthCubit cubit;
  AuthRepo repo = AuthRepo();
  bool isError = false;

  @override
  void initState() {
    isBottomSheet = widget.isBottomSheet;
    cubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !isBottomSheet ? const AppAppBar() : null,
      body: Form(
        key: formKey,
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isBottomSheet)
                  Column(
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
                    ],
                  ),
                Text.rich(
                  TextSpan(
                    text:
                        'Please enter the 4 digital verification code sent to your mobile number ',
                    style: AppStyles.style14GreyRegular,
                    children: [
                      TextSpan(
                        text: '+91-${cubit.phoneController.text}',
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
                Gap(isBottomSheet ? 30.h : 100.h),
                CustomPinPut(
                  pinController: pinController,
                  isError: isError,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 4) {
                      setState(() => isError = true);
                      return 'Enter a valid OTP';
                    }
                    setState(() => isError = false);
                    return null;
                  },
                ),
                Gap(60.h),
                Text(
                  'Didn’t receive OTP?',
                  style: AppStyles.style14GreyRegular,
                ),
                ResendOtpWidget(
                  onResend: resendOtp,
                ),
                Gap(isBottomSheet ? 30.h : 100.h),
                AppButton(
                  title: 'Verify OTP',
                  showIcon: false,
                  onPressed: verifyOtp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> resendOtp() async {
    final number = context.read<AuthCubit>().phoneController.text;
    await repo.requestOtp(91, int.parse(number));
  }

  Future<void> verifyOtp() async {
    if (pinController.text.isEmpty || pinController.text.length < 4) {
      setState(() {
        isError = true;
      });
      return;
    }

    final res = await repo.validateOtp(
      91,
      int.parse(cubit.phoneController.text),
      int.parse(pinController.text),
    );

    if (res) {
      if (UserManager.instance.user!.userName == '') {
        cubit.updateCurrentScreen(2);
        if (!isBottomSheet) {
          Navigator.pushNamed(context, AccountNotFound.route);
        }
      } else {
        cubit.updateCurrentScreen(0);
        Navigator.pushNamed(context, HomeView.route);
      }
    }
  }
}

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
    required this.pinController,
    required this.isError,
    this.validator,
  });

  final String? Function(String?)? validator;
  final TextEditingController pinController;
  final bool isError;

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
      borderRadius: BorderRadius.circular(8.r),
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
          border: Border.all(
              color: isError ? Colors.redAccent : focusedBorderColor),
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(
              color: isError ? Colors.redAccent : focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          border: Border.all(
              color: isError ? Colors.redAccent : focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
      onChanged: (value) {
        if (value.length == 4) {
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}

class ResendOtpWidget extends StatefulWidget {
  final VoidCallback onResend;

  const ResendOtpWidget({super.key, required this.onResend});

  @override
  State<ResendOtpWidget> createState() => _ResendOtpWidgetState();
}

class _ResendOtpWidgetState extends State<ResendOtpWidget> {
  int _remainingTime = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() => _remainingTime--);
      } else {
        _timer?.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Resend OTP',
        style: TextStyle(
          color: _remainingTime > 0 ? Colors.grey : const Color(0xff191919),
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
        recognizer: _remainingTime > 0
            ? null
            : (TapGestureRecognizer()..onTap = widget.onResend),
        children: [
          TextSpan(
            text: ' in ${_formatTime(_remainingTime)}',
            style: const TextStyle(
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
