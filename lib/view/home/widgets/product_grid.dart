import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid.builder(
        itemCount: 10, // Number of items in the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 0.52, // Aspect ratio of each item
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 15, // Spacing between rows
        ),
        itemBuilder: (context, index) => const ProductCard(), // Your grid item
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
                child: Image.network(
                  'https://i.imgur.com/QULzhVh.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 0,
                child: SizedBox(
                  width: 120.w,
                  child: AppImages.verified,
                ),
              ),
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
              const Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  // width: double.infinity,
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
                  'Apple iPhone 13 Pro',
                  style: AppStyles.style14BlackMedium,
                ),
                Gap(4.h),
                Text(
                  '12/256 GB • Like New',
                  style: AppStyles.style12BlackRegular.copyWith(
                    color: const Color(0xff6D6D6D),
                  ),
                ),
                Gap(8.h),
                Row(
                  children: [
                    Text(
                      '₹ 41,500',
                      style: AppStyles.style14BlackBold,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '₹ 81,500',
                      style: AppStyles.style10BlackMedium.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '(45% off)',
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
}
