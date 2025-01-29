import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/presentation/widgets/scaffolds/primary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hideAppbar: true,
      child: Column(
        children: [
          SizedBox(
            height: .075.sh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Close",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(AppColors.blackTextColor)),
                ),
              ),
              Text(
                "Create Post",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(AppColors.black)),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Create",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(AppColors.indigo)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: .025.sh,
          ),
          Container(
            height: .25.sh,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(AppColors.borderColor)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            //  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16.w),
                hintText: "What's on your mind?",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              maxLines: null,
            ),
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 12.h),
          //   child: Row(
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(6.r),
          //           color: Colors.white,
          //         ),
          //         padding: EdgeInsets.all(6.w),
          //         child: Icon(Icons.chevron_left,
          //             size: 24.w, color: const Color(AppColors.greyTextColor)),
          //       ),
          //       SizedBox(width: 12.w),
          //       ...List.generate(
          //         5,
          //         (index) => Padding(
          //           padding: EdgeInsets.only(right: 12.w),
          //           child: Container(
          //             width: 28.w,
          //             height: 28.w,
          //             decoration: BoxDecoration(
          //               color: [
          //                 const Color(0xFFFF1493), // Hot pink
          //                 const Color(0xFF90EE90), // Light green
          //                 const Color(0xFFFF8C00), // Dark orange
          //                 const Color(0xFFFF4500), // Red-orange
          //                 const Color(0xFF00BFFF), // Deep sky blue
          //               ][index],
          //               borderRadius: BorderRadius.circular(6.r),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
