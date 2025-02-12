import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/services/repo/auth_repo.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/widgets/app_button.dart';
import 'package:mobilicis_task/utils/widgets/custom_text_field.dart';
import 'package:mobilicis_task/view/auth/manager/auth_cubit.dart';
import 'package:mobilicis_task/view/auth/verify_otp.dart';

class LoginView extends StatefulWidget {
  static const route = 'login';
  const LoginView({super.key, this.isBottomSheet = false});
  final bool isBottomSheet;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late bool isBottomSheet;
  late TextEditingController phoneController;
  late AuthCubit cubit;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthRepo repo = AuthRepo();
  @override
  void initState() {
    isBottomSheet = widget.isBottomSheet;
    cubit = context.read<AuthCubit>();
    phoneController = cubit.phoneController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !isBottomSheet ? const AppAppBar(firstScreen: true) : null,
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
                        'Welcome',
                        style: AppStyles.style28PurpleSemiBold,
                      ),
                      Text(
                        'Sign in to continue',
                        style: AppStyles.style14GreyRegular,
                      ),
                      Gap(100.h),
                    ],
                  ),
                CustomTextField(
                  title: 'Enter Your Phone Number',
                  hintText: 'Mobile Number',
                  controller: phoneController,
                ),
                Gap(isBottomSheet ? 32.h : 100.h),
                const TermsAndConditions(),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return AppButton(
                      title: 'Next',
                      onPressed: state.termsChecked
                          ? () async {
                              if (formKey.currentState!.validate()) {
                                final res = await repo.requestOtp(
                                    91, int.parse(phoneController.text));
                                if (res) {
                                  cubit.updateCurrentScreen(1);
                                  if (!isBottomSheet) {
                                    Navigator.pushNamed(
                                        context, VerifyOtp.route,
                                        arguments: isBottomSheet);
                                  }
                                }
                              }
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
              side: const BorderSide(
                width: 1,
                color: Color(0xffABABAB),
              ),
              value: state.termsChecked,
              onChanged: (value) {
                context.read<AuthCubit>().onTermsChange(value ?? false);
              },
            );
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
