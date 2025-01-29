import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class CommentWidget extends StatelessWidget {
  final String comment;
  final String userName;
  final int replyCount;
  final int likeCount;
  final DateTime createdAt;
  final bool? isSubComment;

  const CommentWidget(
      {super.key,
      required this.userName,
      required this.comment,
      this.isSubComment,
      required this.replyCount,
      required this.likeCount,
      required this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isSubComment == true ? EdgeInsets.only(left: .08.sh) : null,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: .08.sh,
            width: .08.sh,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              AppImages.roundBlankDp,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: .02.sw,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(AppColors.commentBackgroundColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                            color: const Color(AppColors.black),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        comment,
                        style: TextStyle(
                            color: const Color(AppColors.commentTextGrey),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: .01.sh,
                ),
                if (isSubComment != true)
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: .025.sw),
                        child: Text(
                          timeAgo.format(createdAt),
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(AppColors.blackTextColor)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: .025.sw),
                        child: Text(
                          "Like",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: const Color(AppColors.indigo)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: .025.sw),
                        child: Text(
                          "Reply",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(AppColors.blackTextColor)),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            likeCount.toString(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(AppColors.blackTextColor)),
                          ),
                          SizedBox(
                            width: .015.sw,
                          ),
                          Icon(
                            Icons.thumb_up,
                            size: .02.sh,
                          )
                        ],
                      ),
                    ],
                  ),
                SizedBox(
                  height: .015.sh,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
