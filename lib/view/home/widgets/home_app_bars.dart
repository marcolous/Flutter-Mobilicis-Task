import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/services/manager/user_manager.dart';
import 'package:mobilicis_task/services/repo/auth_repo.dart';
import 'package:mobilicis_task/utils/app_images.dart';
import 'package:mobilicis_task/utils/app_styles.dart';
import 'package:mobilicis_task/view/auth/login_view.dart';
import 'package:mobilicis_task/view/home/home_view.dart';

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
              onPressed: () {
                Navigator.pushReplacementNamed(context, LoginView.route);
              },
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
                UserManager.instance.clearUser();
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
