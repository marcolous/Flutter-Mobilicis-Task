import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/models/product_model.dart';
import 'package:mobilicis_task/services/manager/user_manager.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/cached_network_image.dart';
import 'package:mobilicis_task/view/auth/account_not_found.dart';
import 'package:mobilicis_task/view/auth/login_view.dart';
import 'package:mobilicis_task/view/auth/manager/auth_cubit.dart';
import 'package:mobilicis_task/view/auth/verify_otp.dart';
import 'package:mobilicis_task/view/home/manager/home_cubit.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SliverGrid.builder(
            itemCount: state.products!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.52,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) =>
                ProductCard(product: state.products![index]),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffc8c8c8).withOpacity(.9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xffCFCFCF),
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r),
                ),
                child: CachedImageWidget(
                  imageUrl: product.images![0].thumbImage!,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              if (product.verified!)
                Positioned(
                  top: 10,
                  left: 0,
                  child: SizedBox(
                    width: 120.w,
                    child: AppImages.verified,
                  ),
                ),
              if (product.verified!)
                Positioned(
                  top: 15,
                  left: 8,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'ORU',
                          style: AppStyles.style12WhiteSemiBold,
                        ),
                        TextSpan(
                          text: 'Verified',
                          style: AppStyles.style12WhiteMedium,
                        )
                      ],
                    ),
                  ),
                ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    if (!UserManager.instance.isLoggedIn) {
                      modalBottomSheet(context);
                    }
                  },
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ),
              if (product.openForNegotiation!)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff4C4C4C).withOpacity(.7),
                    ),
                    child: Center(
                      child: Text(
                        'PRICE NEGOTIABLE',
                        style: AppStyles.style12WhiteSemiBold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(10.h),
                Text(
                  product.marketingName!,
                  style: AppStyles.style14BlackMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(4.h),
                Text(
                  '${product.deviceStorage!} • ${product.deviceCondition}',
                  style: AppStyles.style12BlackRegular.copyWith(
                    color: const Color(0xff6D6D6D),
                  ),
                ),
                Gap(8.h),
                Row(
                  children: [
                    Text(
                      '₹ ${product.discountedPrice ?? 0}',
                      style: AppStyles.style14BlackBold,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '₹ ${product.originalPrice ?? 0}',
                      style: AppStyles.style10BlackMedium.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '(${product.discountPercentage?.toStringAsFixed(0) ?? '0'}% off)',
                      style: AppStyles.style10BlackMedium
                          .copyWith(color: Colors.red),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox(height: 10)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: const Color(0xffDFDFDF).withOpacity(.9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nijampur, Luc...',
                    style: AppStyles.style10BlackMedium
                        .copyWith(color: const Color(0xff7D7D7D))),
                Text('July 25th',
                    style: AppStyles.style10BlackMedium
                        .copyWith(color: const Color(0xff7D7D7D))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> modalBottomSheet(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final PageController pageController =
        PageController(initialPage: cubit.state.currentScreen);

    int index = cubit.index;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        child: BlocConsumer<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.currentScreen != current.currentScreen,
          listener: (context, state) {
            index = cubit.index;
            pageController.animateToPage(
              state.currentScreen,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            if (index == 0) {
              cubit.setSheetHeight(300);
              cubit.setSheetTitle('Sign in to continue');
            } else if (index == 1) {
              cubit.setSheetHeight(400);
              cubit.setSheetTitle('Verify OTP');
            } else {
              cubit.setSheetHeight(250);
              cubit.setSheetTitle('Sign Up to continue');
            }
          },
          builder: (context, state) {
            return Container(
              height:
                  MediaQuery.of(context).viewInsets.bottom + cubit.sheetHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              child: Column(
                children: [
                  Gap(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (index == 1)
                          IconButton(
                            onPressed: () {
                              final previousIndex =
                                  cubit.state.currentScreen - 1;
                              cubit.updateCurrentScreen(previousIndex);
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                        Text(
                          cubit.sheetTitle,
                          style: AppStyles.style16DarkGreyRegular
                              .copyWith(color: const Color(0xff1D1B20)),
                        ),
                        IconButton(
                          icon: SizedBox(
                            height: 25.sp,
                            child: AppImages.close,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(.1),
                    thickness: 2,
                  ),
                  Gap(10.h),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        LoginView(isBottomSheet: true),
                        VerifyOtp(isBottomSheet: true),
                        AccountNotFound(isBottomSheet: true),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
