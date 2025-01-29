import 'package:ezy_course/data/model/comment_model.dart';

class Comment {
  final int id;
  final String commentText;
  final String username;
  final String userProfilePic;
  final int likeCount;
  final int replyCount;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.commentText,
    required this.username,
    required this.userProfilePic,
    required this.likeCount,
    required this.replyCount,
    required this.createdAt,
  });

  static Comment fromCommentsModel(CommentsModel model) {
    return Comment(
      id: model.id,
      commentText: model.commentTxt,
      username: model.user.fullName,
      userProfilePic: model.user.profilePic,
      likeCount: model.likeCount,
      replyCount: model.replyCount,
      createdAt: model.createdAt,
    );
  }
}
