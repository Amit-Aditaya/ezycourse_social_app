import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryScaffold extends StatelessWidget {
  final Widget child;
  final bool? hideAppbar;
  final Widget? bottomNavigationBar;

  const PrimaryScaffold(
      {super.key,
      required this.child,
      this.hideAppbar,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.scaffoldBackgroundColor),
      appBar: hideAppbar == true
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(.125.sh),
              child: AppBar(
                toolbarHeight: .125.sh,
                backgroundColor: const Color(AppColors.primaryColor),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Python Developer Community',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: const Color(AppColors.white),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "#General",
                      style: TextStyle(
                          color: const Color(AppColors.greyTextColor),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                leading: Image.asset(AppImages.menu),
              ),
            ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: child,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
