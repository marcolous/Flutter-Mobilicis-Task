import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/services/repo/auth_repo.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';
import 'package:mobilicis_task/utils/widgets/app_button.dart';
import 'package:mobilicis_task/utils/widgets/custom_text_field.dart';
import 'package:mobilicis_task/view/home/home_view.dart';

class AccountNotFound extends StatefulWidget {
  static const route = 'accountNotFound';
  const AccountNotFound({super.key, this.isBottomSheet = false});
  final bool isBottomSheet;
  @override
  State<AccountNotFound> createState() => _AccountNotFoundState();
}

class _AccountNotFoundState extends State<AccountNotFound> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  AuthRepo repo = AuthRepo();
  late bool isBottomSheet;

  @override
  void initState() {
    isBottomSheet = widget.isBottomSheet;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                        'Welcome',
                        style: AppStyles.style28PurpleSemiBold,
                      ),
                      Text(
                        'SignUp to continue',
                        style: AppStyles.style14GreyRegular,
                      ),
                      Gap(100.h),
                    ],
                  ),
                CustomTextField(
                  title: 'Please Tell Us Your Name ',
                  hintText: 'Name',
                  hasAst: true,
                  isText: true,
                  controller: controller,
                ),
                Gap(isBottomSheet ? 20.h : 100.h),
                AppButton(
                  title: 'Confirm Name',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final res = await repo.updateUser(91, controller.text);
                      if (res) {
                        Navigator.pushNamed(context, HomeView.route);
                      }
                    }
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
