import 'package:ezy_course/presentation/widgets/components/comment_widget.dart';
import 'package:ezy_course/presentation/widgets/textfields/comment_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsBottomSheet extends StatelessWidget {
  const CommentsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CommentSection(
      comments: [
        Comment(
          username: 'IAP Testing',
          content:
              '4 cup toakie my name is Amit and this is my first comment, hope you are are doing well. I am jsut testing is a really really really long comment',
          timeAgo: '22d',
          likes: 1,
          replies: [
            Comment(
              username: 'User2',
              content: 'Hhh...',
              timeAgo: '22d',
              likes: 0,
              replies: [
                Comment(
                  username: 'User3',
                  content: 'Nested reply',
                  timeAgo: '21d',
                  likes: 2,
                ),
              ],
            ),
          ],
        ),
        Comment(
          username: 'AnotherUser',
          content: 'Parent comment',
          timeAgo: '1d',
          likes: 3,
        ),
      ],
    );
  }
}

class Comment {
  final String username;
  final String content;
  final String timeAgo;
  final int likes;
  final List<Comment> replies;

  Comment({
    required this.username,
    required this.content,
    required this.timeAgo,
    required this.likes,
    this.replies = const [],
  });
}

class CommentSection extends StatelessWidget {
  final List<Comment> comments;

  const CommentSection({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: .05.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: .025.sh,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "You and 2 others",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: .025.sh,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const CommentWidget();
                    }),
              ),
            ),
            const CommentTextField(),
          ],
        ),
      ),
    );
  }
}
