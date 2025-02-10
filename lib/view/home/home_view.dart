import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/utils/widgets/app_app_bar.dart';
import 'package:mobilicis_task/view/home/widgets/filter_bottom_sheet.dart';
import 'package:mobilicis_task/view/home/widgets/home_title_text.dart';
import 'package:mobilicis_task/view/home/widgets/search_and_tags.dart';
import 'package:mobilicis_task/view/home/widgets/slidable_home_ad_banner.dart';
import 'package:mobilicis_task/view/home/widgets/sort_bottom_sheet.dart';
import 'package:mobilicis_task/view/home/widgets/top_brands_list_view.dart';
import 'package:mobilicis_task/view/home/widgets/your_mind_list_view.dart';

class HomeView extends StatelessWidget {
  static const route = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: customFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const HomeAppBar(),
        drawer: const AppDrawerLoggedIn(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchAndTags(),
              const SlidableHomeAdBanner(),
              Gap(20.h),
              const HomeTitleText(title1: 'What’s on your mind?'),
              Gap(10.h),
              const YourMindListView(),
              Gap(10.h),
              const HomeTitleText(title1: 'Top brands', showIcon: true),
              Gap(15.h),
              const TopBrandsListView(),
              Gap(40.h),
              const HomeTitleText(title1: 'Best deals', title2: ' in India'),
              Gap(20.h),
              const FilterSort(),
              const ProductsGridView(),
            ],
          ),
        ),
      ),
    );
  }

  Container customFloatingActionButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        color: const Color(0xffF6C018),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.w),
        margin: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: const Color(0xff363636),
        ),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sell',
                style: AppStyles.style16YellowSemiBold,
              ),
              Gap(5.w),
              Icon(
                Icons.add,
                color: const Color(0xffF6C018),
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (context) => IconButton(
          icon: SizedBox(
            width: 25.w,
            child: AppImages.drawer,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60.w,
            child: AppImages.logo,
          ),
          Row(
            children: [
              const Text(
                'India',
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 20,
                child: AppImages.location,
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF6C018),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  static final list = [
    AppImages.drawer1,
    AppImages.drawer2,
    AppImages.drawer3,
    AppImages.drawer4,
    AppImages.drawer5,
    AppImages.drawer6,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            color: const Color(0xffF4F4F4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 30.h,
                  child: AppImages.logo2,
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SizedBox(
                    height: 30.h,
                    child: AppImages.close,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3E468F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Login/SignUp',
                style: AppStyles.style16BlackMedium
                    .copyWith(color: const Color(0xffFFFFFF)),
              ),
            ),
          ),
          ListTile(
            title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF6C018),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Sell Your Phone',
                  style: AppStyles.style16BlackMedium,
                )),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) => list[index],
            ),
          ),
        ],
      ),
    );
  }
}

class AppDrawerLoggedIn extends StatelessWidget {
  const AppDrawerLoggedIn({super.key});
  static final list = [
    AppImages.drawer1,
    AppImages.drawer2,
    AppImages.drawer6,
    AppImages.drawer3,
    AppImages.drawer4,
    AppImages.drawer7,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            color: const Color(0xffF4F4F4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30.h,
                      child: AppImages.logo2,
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SizedBox(
                        height: 30.h,
                        child: AppImages.close,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://i.imgur.com/QULzhVh.png'),
                      radius: 25,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rahul Sharma',
                          style: AppStyles.style16BlackMedium
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Joined: July 6 2024',
                          style: AppStyles.style12BlackMedium
                              .copyWith(color: const Color(0xffABABAB)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF6C018),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Sell Your Phone',
                  style: AppStyles.style16BlackMedium,
                )),
          ),
          ListTile(
            leading: SizedBox(
              height: 24.h,
              child: AppImages.logout,
            ),
            title: Text(
              'Logout',
              style: AppStyles.style14GreyRegular.copyWith(color: Colors.black),
            ),
            onTap: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) => list[index],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterSort extends StatelessWidget {
  const FilterSort({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          filterSortItem(
              'Sort', AppImages.sort, () => showSortBottomSheet(context)),
          Gap(10.w),
          filterSortItem('Filters', AppImages.filter,
              () => showFilterBottomSheet(context)),
        ],
      ),
    );
  }

  Widget filterSortItem(
      String title, Widget image, void Function()? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffE0E0E0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
                child: image,
              ),
              Gap(10.w),
              Text(
                title,
                style: AppStyles.style12BlackMedium.copyWith(
                  color: const Color(0xff121212),
                ),
              ),
              Gap(10.w),
              const Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        ),
      ),
    );
  }
}

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .56,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) => const ProductCard(),
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
                      style: AppStyles.style16BlackBold,
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
                    style: AppStyles.style12BlackMedium
                        .copyWith(color: const Color(0xff7D7D7D))),
                Text('July 25th',
                    style: AppStyles.style12BlackMedium
                        .copyWith(color: const Color(0xff7D7D7D))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
