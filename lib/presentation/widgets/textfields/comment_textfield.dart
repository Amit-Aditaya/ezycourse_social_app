import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onTap;

  const CommentTextField(
      {super.key, required this.controller, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .11.sh,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Image(
            image: AssetImage(AppImages.roundBlankDp),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              onTap();
            },
            child: Container(
              height: double.infinity,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r)),
                color: const Color(AppColors.primaryColor),
              ),
              child: Center(
                child: Image.asset(AppImages.sent),
              ),
            ),
          ),
          hintText: 'Write a Comment',
          hintStyle: TextStyle(
              color: const Color(AppColors.greyTextColor),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(AppColors.commentBackgroundColor),
        ),
      ),
    );
  }
}
