import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobilicis_task/services/manager/user_manager.dart';
import 'package:mobilicis_task/services/repo/auth_repo.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/view/auth/login_view.dart';
import 'package:mobilicis_task/view/home/widgets/filter_sort.dart';
import 'package:mobilicis_task/view/home/widgets/home_title_text.dart';
import 'package:mobilicis_task/view/home/widgets/product_grid.dart';
import 'package:mobilicis_task/view/home/widgets/search_and_tags.dart';
import 'package:mobilicis_task/view/home/widgets/slidable_home_ad_banner.dart';
import 'package:mobilicis_task/view/home/widgets/top_brands_list_view.dart';
import 'package:mobilicis_task/view/home/widgets/your_mind_list_view.dart';

class HomeView extends StatelessWidget {
  static const route = 'home';
  const HomeView({super.key});

  Future<void> test() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: customFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: const AppDrawerLoggedIn(),
        body: RefreshIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 2,
          onRefresh: () {
            return test();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: SizedBox(
                      width: 25.w,
                      child: AppImages.drawer,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                titleSpacing: BorderSide.strokeAlignInside,
                title: Row(
                  children: [
                    SizedBox(
                      width: 60.w,
                      child: AppImages.logo,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          'India',
                          style: AppStyles.style12BlackRegular,
                        ),
                        Gap(5.w),
                        SizedBox(
                          width: 15.h,
                          child: AppImages.location,
                        ),
                        if (!UserManager.instance.isLoggedIn)
                          Row(
                            children: [
                              Gap(15.w),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(80.w, 30.h),
                                  backgroundColor: const Color(0xffF6C018),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, LoginView.route);
                                },
                                child: Text(
                                  'Login',
                                  style: AppStyles.style12BlackMedium,
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                    Gap(16.w),
                  ],
                ),
                pinned: false,
                floating: true,
                snap: true,
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SearchAndTagsHeaderDelegate(
                  child: const SearchAndTags(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
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
                    const HomeTitleText(
                        title1: 'Best deals', title2: ' in India'),
                    Gap(20.h),
                    const FilterSort(),
                    Gap(20.h),
                  ],
                ),
              ),
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

class _SearchAndTagsHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SearchAndTagsHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.white.withOpacity(0.8),
          child: child,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 130.h;

  @override
  double get minExtent => 130.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
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
            onTap: () async {
              AuthRepo repo = AuthRepo();
              final res = await repo.logout();
              if (res) {
                Navigator.pushNamed(context, HomeView.route);
              }
            },
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
