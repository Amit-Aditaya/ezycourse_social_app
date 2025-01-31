// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

List<CommentsModel> commentsModelFromJson(String str) =>
    List<CommentsModel>.from(
        json.decode(str).map((x) => CommentsModel.fromJson(x)));

String commentsModelToJson(List<CommentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsModel {
  int id;
  int schoolId;
  int feedId;
  int userId;
  int replyCount;
  int likeCount;
  String commentTxt;
  dynamic parrentId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic file;
  dynamic privateUserId;
  int isAuthorAndAnonymous;
  dynamic gift;
  dynamic sellerId;
  dynamic giftedCoins;
  List<dynamic> replies;
  User user;
  List<dynamic> totalLikes;
  List<dynamic> reactionTypes;
  dynamic privateUser;
  dynamic commentlike;

  CommentsModel({
    required this.id,
    required this.schoolId,
    required this.feedId,
    required this.userId,
    required this.replyCount,
    required this.likeCount,
    required this.commentTxt,
    required this.parrentId,
    required this.createdAt,
    required this.updatedAt,
    required this.file,
    required this.privateUserId,
    required this.isAuthorAndAnonymous,
    required this.gift,
    required this.sellerId,
    required this.giftedCoins,
    required this.replies,
    required this.user,
    required this.totalLikes,
    required this.reactionTypes,
    required this.privateUser,
    required this.commentlike,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
        id: json["id"],
        schoolId: json["school_id"],
        feedId: json["feed_id"],
        userId: json["user_id"],
        replyCount: json["reply_count"],
        likeCount: json["like_count"],
        commentTxt: json["comment_txt"],
        parrentId: json["parrent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        file: json["file"],
        privateUserId: json["private_user_id"],
        isAuthorAndAnonymous: json["is_author_and_anonymous"],
        gift: json["gift"],
        sellerId: json["seller_id"],
        giftedCoins: json["gifted_coins"],
        replies: List<dynamic>.from(json["replies"].map((x) => x)),
        user: User.fromJson(json["user"]),
        totalLikes: List<dynamic>.from(json["totalLikes"].map((x) => x)),
        reactionTypes: List<dynamic>.from(json["reaction_types"].map((x) => x)),
        privateUser: json["private_user"],
        commentlike: json["commentlike"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_id": schoolId,
        "feed_id": feedId,
        "user_id": userId,
        "reply_count": replyCount,
        "like_count": likeCount,
        "comment_txt": commentTxt,
        "parrent_id": parrentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "file": file,
        "private_user_id": privateUserId,
        "is_author_and_anonymous": isAuthorAndAnonymous,
        "gift": gift,
        "seller_id": sellerId,
        "gifted_coins": giftedCoins,
        "replies": List<dynamic>.from(replies.map((x) => x)),
        "user": user.toJson(),
        "totalLikes": List<dynamic>.from(totalLikes.map((x) => x)),
        "reaction_types": List<dynamic>.from(reactionTypes.map((x) => x)),
        "private_user": privateUser,
        "commentlike": commentlike,
      };
}

class User {
  int id;
  String fullName;
  String profilePic;
  String userType;
  Meta meta;

  User({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.userType,
    required this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        profilePic: json["profile_pic"],
        userType: json["user_type"],
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_pic": profilePic,
        "user_type": userType,
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
