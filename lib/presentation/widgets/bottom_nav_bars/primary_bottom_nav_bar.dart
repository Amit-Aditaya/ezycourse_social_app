import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryBottomNavBar extends StatelessWidget {
  const PrimaryBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        unselectedItemColor: const Color(AppColors.blackTextColor),
        unselectedLabelStyle: TextStyle(
            color: const Color(AppColors.blackTextColor),
            fontWeight: FontWeight.w700,
            fontSize: 12.sp),
        selectedItemColor: const Color(AppColors.primaryColor),
        selectedLabelStyle: TextStyle(
            color: const Color(AppColors.indigo),
            fontWeight: FontWeight.w700,
            fontSize: 12.sp),
        items: const [
          BottomNavigationBarItem(
              icon: Image(image: AssetImage(AppImages.community)),
              label: "Community"),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage(AppImages.logout)),
              label: "Logout"),
        ]);
  }
}
