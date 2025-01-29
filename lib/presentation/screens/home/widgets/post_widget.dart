import 'package:auto_size_text/auto_size_text.dart';
import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: .1.sh,
      padding: EdgeInsets.symmetric(horizontal: .025.sw),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(AppColors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image.asset(AppImages.squareBlankDp),
          SizedBox(
            width: .025.sw,
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              //  color: Colors.teal,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  'Write Something Here...',
                  minFontSize: 15.sp.roundToDouble(),
                  maxFontSize: 18.sp.roundToDouble(),
                  stepGranularity: .1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      //   fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(AppColors.greyTextColor)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: .025.sw,
          ),
          Container(
            height: .045.sh,
            width: .17.sw,
            decoration: BoxDecoration(
                color: const Color(AppColors.primaryColor),
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                'Post',
                style: TextStyle(
                    color: const Color(AppColors.white),
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
