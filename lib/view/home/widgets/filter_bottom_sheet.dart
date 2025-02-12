import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/models/filter_model.dart';
import 'package:mobilicis_task/services/repo/home_repo.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/view/home/manager/filter_cubit.dart';
import 'package:mobilicis_task/view/home/manager/home_cubit.dart';

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
                      onPressed: () async {
                        final model = context.read<HomeCubit>().model;
                        final selectedSubcategories = context
                            .read<FilterCubit>()
                            .state
                            .selectedSubcategories;

                        List<String> brand =
                            selectedSubcategories['Brand'] ?? [];
                        List<String> condition =
                            selectedSubcategories['Condition'] ?? [];
                        List<String> storage =
                            selectedSubcategories['Storage'] ?? [];
                        List<String> ram = selectedSubcategories['RAM'] ?? [];
                        bool verification =
                            selectedSubcategories['Verification'] ?? true;
                        List<String> warranty =
                            selectedSubcategories['Warranty'] ?? [];

                        model.brand = brand;
                        model.conditions = condition;
                        model.storage = storage;
                        model.ram = ram;
                        model.verified = verification;
                        model.warranty = warranty;
                        model.priceRange = [];

                        await context
                            .read<HomeCubit>()
                            .fetchFilteredProducts(model);

                        Navigator.pop(context);
                      },
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
        bool picked = context.watch<FilterCubit>().state.selectedCategory ==
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

    final subcategories = _getSubcategories(context, selectedCategory);

    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: subcategories.length,
          itemBuilder: (context, index) {
            final isSelected =
                state.selectedSubcategories[selectedCategory] != null &&
                    state.selectedSubcategories[selectedCategory]!
                        .contains(subcategories[index]);

            return GestureDetector(
              onTap: () {
                context
                    .read<FilterCubit>()
                    .toggleSubcategory(selectedCategory!, subcategories[index]);
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
                      context.read<FilterCubit>().toggleSubcategory(
                          selectedCategory!, subcategories[index]);
                    },
                  ),
                  Text(
                    subcategories[index],
                    style: AppStyles.style14GreyRegular
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<String> _getSubcategories(BuildContext context, String? category) {
    switch (category) {
      case 'Brand':
        return context.read<HomeCubit>().filter!.brand!;
      case 'Condition':
        return context.read<HomeCubit>().filter!.conditions!;
      case 'Storage':
        return context.read<HomeCubit>().filter!.storage!;
      case 'RAM':
        return context.read<HomeCubit>().filter!.ram!;
      case 'Verification':
        return ['All', 'Verified Only'];
      case 'Warranty':
        return context.read<HomeCubit>().filter!.warranty!;
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
                final model = context.read<HomeCubit>().model;
                model.priceRange = [values.start, values.end];
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
