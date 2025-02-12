import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/widgets/cached_network_image.dart';
import 'package:mobilicis_task/view/home/manager/home_cubit.dart';

class TopBrandsListView extends StatelessWidget {
  const TopBrandsListView({super.key});
  static final topBrandsList = [
    AppImages.apple,
    AppImages.mi,
    AppImages.samsung,
    AppImages.vivo,
    AppImages.realme,
    AppImages.m,
    AppImages.oppo,
    AppImages.viewAll,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 70.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CircleAvatar(
              radius: 35.r,
              backgroundColor: const Color(0xffF2F2F2),
              child: SizedBox(
                width: 55.w,
                child: CachedImageWidget(
                    imageUrl: state.brands![index].imagePath!),
              ),
            ),
            separatorBuilder: (context, index) => Gap(17.w),
            itemCount: state.brands!.length,
          ),
        );
      },
    );
  }
}
