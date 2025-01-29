import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;

  const PrimaryTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .06.sh,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Color(AppColors.white)),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: .015.sh, horizontal: .04.sw),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(AppColors.borderColor).withOpacity(.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(AppColors.borderColor).withOpacity(.5)),
          ),
          filled: true,
          fillColor: const Color(AppColors.white).withOpacity(0.1),
        ),
      ),
    );
  }
}
