import 'package:ezy_course/core/theme/app_colors.dart';
import 'package:ezy_course/core/utils/constants/app_images.dart';
import 'package:ezy_course/presentation/widgets/bottom_sheets/comments_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialPost extends StatefulWidget {
  final String username;
  final String? userImage;
  final String timeAgo;
  final String content;
  final String imageUrl;
  final int likes;
  final int comments;

  const SocialPost({
    super.key,
    required this.username,
    required this.userImage,
    required this.timeAgo,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  State<SocialPost> createState() => _SocialPostState();
}

class _SocialPostState extends State<SocialPost> {
  String? selectedReaction;
  final List<Reaction> reactions = [
    Reaction(
      id: 'like',
      previewIcon: '👍',
      icon: _buildReactionIcon('👍', 'Like'),
      name: 'Like',
    ),
    Reaction(
      id: 'love',
      previewIcon: '❤️',
      icon: _buildReactionIcon('❤️', 'Love'),
      name: 'Love',
    ),
    Reaction(
      id: 'haha',
      previewIcon: '😂',
      icon: _buildReactionIcon('😂', 'Haha'),
      name: 'Haha',
    ),
    Reaction(
      id: 'wow',
      previewIcon: '😮',
      icon: _buildReactionIcon('😮', 'Wow'),
      name: 'Wow',
    ),
    Reaction(
      id: 'sad',
      previewIcon: '😢',
      icon: _buildReactionIcon('😢', 'Sad'),
      name: 'Sad',
    ),
    Reaction(
      id: 'angry',
      previewIcon: '😠',
      icon: _buildReactionIcon('😠', 'Angry'),
      name: 'Angry',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: Card(
        elevation: 0,
        color: const Color(AppColors.scaffoldBackgroundColor),
        margin: EdgeInsets.symmetric(vertical: .01.sh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: widget.userImage == null || widget.userImage!.isEmpty
                  ? Image.asset(AppImages.roundBlankDp)
                  : CircleAvatar(
                      backgroundImage: NetworkImage(widget.userImage!),
                    ),
              title: Text(
                widget.username,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: const Color(AppColors.blackTextColor)),
              ),
              subtitle: Text(
                widget.timeAgo,
                style: TextStyle(
                    color: const Color(
                      AppColors.darkGreyTextColor,
                    ),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              trailing: const Icon(
                Icons.more_vert,
                color: Color(AppColors.blackTextColor),
              ),
            ),
            const Divider(
              height: 1,
            ),
            SizedBox(
              height: .01.sh,
            ),

            // Post content
            Text(
              widget.content,
              style: TextStyle(
                  height: 1.6,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(AppColors.blackTextColor)),
            ),
            SizedBox(height: .025.sh),

            // Post image
            if (widget.imageUrl.isNotEmpty)
              Container(
                width: double.infinity,
                height: .225.sh,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            // Likes and comments count
            Padding(
              padding: EdgeInsets.symmetric(vertical: .015.sh),
              child: Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onLongPressStart: (details) {
                            _showReactionPicker(
                              context,
                              details.globalPosition,
                            );
                          },
                          child: const Icon(Icons.thumb_up,
                              color: Colors.blue, size: 20)),
                      const Icon(Icons.favorite, color: Colors.red, size: 20),
                      const SizedBox(width: 4),
                      Text('You and ${widget.likes} others'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.comment_outlined),
                      const SizedBox(width: 4),
                      Text('${widget.comments} Comments'),
                    ],
                  ),
                ],
              ),
            ),

            // Divider
            const Divider(height: 1),

            // Action buttons
            Padding(
              padding: EdgeInsets.symmetric(vertical: .01.sh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onLongPressStart: (details) {
                      _showReactionPicker(
                        context,
                        details.globalPosition,
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.thumb_up),
                        SizedBox(
                          width: .025.sw,
                        ),
                        Text(
                          "Like",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (c) {
                            return FractionallySizedBox(
                              heightFactor: .85,
                              child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(AppColors.white),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.r),
                                      topRight: Radius.circular(20.r),
                                    ),
                                  ),
                                  child: const CommentsBottomSheet()),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.comment_outlined),
                        SizedBox(
                          width: .025.sw,
                        ),
                        Text(
                          "Comment",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildReactionIcon(String emoji, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  void _showReactionPicker(BuildContext context, Offset position) {
    showReactionPicker(
      context: context,
      reactions: reactions,
      position: position,
      onReactionSelected: (reaction) {
        setState(() {
          selectedReaction = reaction.id;
        });
      },
    );
  }

  void showReactionPicker({
    required BuildContext context,
    required List<Reaction> reactions,
    required Offset position,
    required Function(Reaction) onReactionSelected,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    final popupWidth = reactions.length * 46.0;

    final leftPosition = ((screenWidth - popupWidth) / 2) - 50;

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              left: leftPosition,
              top: position.dy - 100,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: reactions.map((reaction) {
                      return InkWell(
                        onTap: () {
                          onReactionSelected(reaction);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            reaction.previewIcon,
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Reaction {
  final String id;
  final String previewIcon;
  final Widget icon;
  final String name;

  Reaction({
    required this.id,
    required this.previewIcon,
    required this.icon,
    required this.name,
  });
}
