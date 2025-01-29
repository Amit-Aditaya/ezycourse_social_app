import 'package:ezy_course/data/model/feed_model.dart';

class Feed {
  final String username;
  final String title;
  final String feedText;
  final String userProfilePic;
  final String postImage;
  final DateTime publishDate;
  final int commentCounter;
  final int likeCounter;
  final int feedId;

  Feed({
    required this.username,
    required this.title,
    required this.feedText,
    required this.userProfilePic,
    required this.postImage,
    required this.publishDate,
    required this.commentCounter,
    required this.likeCounter,
    required this.feedId,
  });

  // Extension method to convert FeedModel to Feed
  static Feed fromFeedModel(FeedModel model) {
    return Feed(
        username: model.user.fullName,
        title: model.title,
        feedText: model.feedTxt,
        userProfilePic: model.user.profilePic,
        publishDate: model.publishDate,
        commentCounter: model.commentCount,
        likeCounter: model.likeCount,
        feedId: model.id,
        postImage: model.pic);
  }
}
