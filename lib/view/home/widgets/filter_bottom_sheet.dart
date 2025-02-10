import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/view/home/manager/filter_cubit.dart';

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => BlocProvider(
      create: (_) => FilterCubit(),
      child: const FilterBottomSheetContent(),
    ),
  );
}

class FilterBottomSheetContent extends StatelessWidget {
  const FilterBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filters', style: AppStyles.style18DarkGreyMedium),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 500,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildCategoryList(context),
                  ),
                  const VerticalDivider(width: 1, color: Colors.grey),
                  Expanded(
                    flex: 3,
                    child: _buildSubcategoryList(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Gap(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => context.read<FilterCubit>().clearFilters(),
                    child: Text(
                      'Clear',
                      style: AppStyles.style14BlackMedium
                          .copyWith(color: const Color(0xffF4C45D)),
                    ),
                  ),
                  SizedBox(
                    width: 180.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF6C018),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text('Apply', style: AppStyles.style14BlackMedium),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.h),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    final categories = [
      'Brand',
      'Condition',
      'Storage',
      'RAM',
      'Verification',
      'Warranty',
      'Price Range',
    ];
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final picked = context.watch<FilterCubit>().state.selectedCategory ==
            categories[index];
        return Container(
          decoration: BoxDecoration(
              color: picked
                  ? const Color(0xffF6C018).withOpacity(.07)
                  : Colors.white,
              border: Border(
                left: BorderSide(
                  color: picked ? const Color(0xffF6C018) : Colors.white,
                  width: 4,
                ),
              )),
          child: ListTile(
            title: Text(
              categories[index],
              style: AppStyles.style14BlackMedium,
            ),
            onTap: () {
              context.read<FilterCubit>().selectCategory(categories[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildSubcategoryList(BuildContext context) {
    final selectedCategory =
        context.watch<FilterCubit>().state.selectedCategory;

    if (selectedCategory == 'Price Range') {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: _buildPriceRangeSection(context),
      );
    }

    final subcategories = _getSubcategories(selectedCategory);

    return ListView.builder(
      itemCount: subcategories.length,
      itemBuilder: (context, index) {
        final isSelected = context
            .watch<FilterCubit>()
            .state
            .selectedSubcategories
            .contains(subcategories[index]);

        return GestureDetector(
          onTap: () {
            context.read<FilterCubit>().toggleSubcategory(subcategories[index]);
          },
          child: Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                checkColor: Colors.white,
                activeColor: const Color(0xff484848),
                side: const BorderSide(color: Color(0xffD9D9D9)),
                value: isSelected,
                onChanged: (bool? value) {
                  context
                      .read<FilterCubit>()
                      .toggleSubcategory(subcategories[index]);
                },
              ),
              Text(
                subcategories[index],
                style:
                    AppStyles.style14GreyRegular.copyWith(color: Colors.black),
              )
            ],
          ),
        );
      },
    );
  }

  List<String> _getSubcategories(String? category) {
    switch (category) {
      case 'Brand':
        return [
          'All Brands',
          'Apple',
          'Samsung',
          'Google',
          'OnePlus',
          'Xiaomi',
        ];
      case 'Condition':
        return [
          'All Conditions',
          'Like New',
          'Excellent',
          'Good',
          'Fair',
          'Needs Repair'
        ];
      case 'Storage':
        return [
          'All',
          '8 GB',
          '16 GB',
          '32 GB',
          '64 GB',
          '128 GB',
          '256 GB',
          '512 GB',
          '1 TB'
        ];

      case 'RAM':
        return [
          'All',
          '2 GB',
          '3 GB',
          '4 GB',
          '6 GB',
          '8 GB',
          '12 GB',
          '16 GB'
        ];
      case 'Verification':
        return ['All', 'Verified Only'];
      case 'Warranty':
        return ['Brand Warranty', 'Seller Warranty'];
      default:
        return [];
    }
  }

  Widget _buildPriceRangeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Any', style: AppStyles.style12BlackMedium),
        Text('Maximum Price', style: AppStyles.style10BlackMedium),
        SizedBox(
          height: 400,
          child: RotatedBox(
            quarterTurns: 3,
            child: RangeSlider(
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              values: context.watch<FilterCubit>().state.priceRange,
              min: 5000,
              max: 100000,
              divisions: 200,
              labels: RangeLabels(
                context
                    .watch<FilterCubit>()
                    .state
                    .priceRange
                    .start
                    .round()
                    .toString(),
                context
                    .watch<FilterCubit>()
                    .state
                    .priceRange
                    .end
                    .round()
                    .toString(),
              ),
              onChanged: (RangeValues values) {
                context.read<FilterCubit>().updatePriceRange(values);
              },
            ),
          ),
        ),
        Text('Minimum Price', style: AppStyles.style10BlackMedium),
        Text('₹ 5,000', style: AppStyles.style12BlackMedium),
        Gap(16.h),
      ],
    );
  }
}
