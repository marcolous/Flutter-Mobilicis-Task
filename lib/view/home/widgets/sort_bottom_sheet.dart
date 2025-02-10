import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

void showSortBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return const SortBottomSheet();
    },
  );
}

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  SortBottomSheetState createState() => SortBottomSheetState();
}

class SortBottomSheetState extends State<SortBottomSheet> {
  String? selectedOption = 'Value For Money';
  final List<String> sortOptions = [
    'Value For Money',
    'Price: High To Low',
    'Price: Low To High',
    'Latest',
    'Distance'
  ];

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
                  Text('Sort', style: AppStyles.style18DarkGreyMedium),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            const Divider(),
            Column(
              children: sortOptions.map((option) {
                return Container(
                  color: selectedOption == option
                      ? const Color(0xffF6C018).withOpacity(.07)
                      : null,
                  child: ListTile(
                    title: Text(option, style: AppStyles.style14BlackMedium),
                    tileColor: selectedOption == option
                        ? const Color(0xffF6C018)
                        : null,
                    trailing: Radio<String>(
                      value: option,
                      groupValue: selectedOption,
                      activeColor: const Color(0xffF6C018),
                      onChanged: (value) =>
                          setState(() => selectedOption = value),
                    ),
                    onTap: () => setState(() => selectedOption = option),
                  ),
                );
              }).toList(),
            ),
            Gap(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => setState(() => selectedOption = null),
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
                      onPressed: selectedOption != null ? () {} : null,
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
}
