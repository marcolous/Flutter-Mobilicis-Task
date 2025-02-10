import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/app_images.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffABABAB) : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: const Color(0xffABABAB),
          width: 1,
        ),
      ),
    );
  }
}

class SlidableHomeAdBanner extends StatefulWidget {
  const SlidableHomeAdBanner({super.key});

  @override
  State<SlidableHomeAdBanner> createState() => _SlidableHomeAdBannerState();
}

class _SlidableHomeAdBannerState extends State<SlidableHomeAdBanner> {
  final images = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
    AppImages.banner4,
    AppImages.banner5,
  ];
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      _currentPage = (_currentPage + 1) % images.length;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: images[index],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: CustomDotIndicator(isActive: _currentPage == index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
