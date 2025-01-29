// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'dart:convert';

List<FeedModel> feedModelFromJson(String str) =>
    List<FeedModel>.from(json.decode(str).map((x) => FeedModel.fromJson(x)));

String feedModelToJson(List<FeedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedModel {
  final int id;
  final int schoolId;
  final int userId;
  final dynamic courseId;
  final int communityId;
  final dynamic groupId;
  final String feedTxt;
  final Status status;
  final String slug;
  final String title;
  final ActivityType activityType;
  final int isPinned;
  final FileType fileType;
  final List<dynamic> files;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final int shareId;
  final MetaDataClass metaData;
  final DateTime createdAt;
  final DateTime updatedAt;
  final FeedPrivacy feedPrivacy;
  final int isBackground;
  final String bgColor;
  final dynamic pollId;
  final dynamic lessonId;
  final int spaceId;
  final dynamic videoId;
  final dynamic streamId;
  final dynamic blogId;
  final dynamic scheduleDate;
  final String timezone;
  final int isAnonymous;
  final dynamic meetingId;
  final dynamic sellerId;
  final DateTime publishDate;
  final bool isFeedEdit;
  final String name;
  final String pic;
  final int uid;
  final int isPrivateChat;
  final User user;
  final dynamic group;
  final dynamic follow;
  final List<LikeType> likeType;
  final Like like;
  final dynamic poll;
  final dynamic savedPosts;
  final List<dynamic> comments;
  final PurpleMeta meta;

  FeedModel({
    required this.id,
    required this.schoolId,
    required this.userId,
    required this.courseId,
    required this.communityId,
    required this.groupId,
    required this.feedTxt,
    required this.status,
    required this.slug,
    required this.title,
    required this.activityType,
    required this.isPinned,
    required this.fileType,
    required this.files,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.shareId,
    required this.metaData,
    required this.createdAt,
    required this.updatedAt,
    required this.feedPrivacy,
    required this.isBackground,
    required this.bgColor,
    required this.pollId,
    required this.lessonId,
    required this.spaceId,
    required this.videoId,
    required this.streamId,
    required this.blogId,
    required this.scheduleDate,
    required this.timezone,
    required this.isAnonymous,
    required this.meetingId,
    required this.sellerId,
    required this.publishDate,
    required this.isFeedEdit,
    required this.name,
    required this.pic,
    required this.uid,
    required this.isPrivateChat,
    required this.user,
    required this.group,
    required this.follow,
    required this.likeType,
    required this.like,
    required this.poll,
    required this.savedPosts,
    required this.comments,
    required this.meta,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json["id"],
        schoolId: json["school_id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        communityId: json["community_id"],
        groupId: json["group_id"],
        feedTxt: json["feed_txt"],
        status: statusValues.map[json["status"]]!,
        slug: json["slug"],
        title: json["title"],
        activityType: activityTypeValues.map[json["activity_type"]]!,
        isPinned: json["is_pinned"],
        fileType: fileTypeValues.map[json["file_type"]]!,
        files: List<dynamic>.from(json["files"].map((x) => x)),
        likeCount: json["like_count"],
        commentCount: json["comment_count"],
        shareCount: json["share_count"],
        shareId: json["share_id"],
        metaData: MetaDataClass.fromJson(json["meta_data"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        feedPrivacy: feedPrivacyValues.map[json["feed_privacy"]]!,
        isBackground: json["is_background"],
        bgColor: json["bg_color"],
        pollId: json["poll_id"],
        lessonId: json["lesson_id"],
        spaceId: json["space_id"],
        videoId: json["video_id"],
        streamId: json["stream_id"],
        blogId: json["blog_id"],
        scheduleDate: json["schedule_date"],
        timezone: json["timezone"],
        isAnonymous: json["is_anonymous"],
        meetingId: json["meeting_id"],
        sellerId: json["seller_id"],
        publishDate: DateTime.parse(json["publish_date"]),
        isFeedEdit: json["is_feed_edit"],
        name: json["name"],
        pic: json["pic"],
        uid: json["uid"],
        isPrivateChat: json["is_private_chat"],
        user: User.fromJson(json["user"]),
        group: json["group"],
        follow: json["follow"],
        likeType: List<LikeType>.from(
            json["likeType"].map((x) => LikeType.fromJson(x))),
        like: Like.fromJson(json["like"]),
        poll: json["poll"],
        savedPosts: json["savedPosts"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        meta: PurpleMeta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_id": schoolId,
        "user_id": userId,
        "course_id": courseId,
        "community_id": communityId,
        "group_id": groupId,
        "feed_txt": feedTxt,
        "status": statusValues.reverse[status],
        "slug": slug,
        "title": title,
        "activity_type": activityTypeValues.reverse[activityType],
        "is_pinned": isPinned,
        "file_type": fileTypeValues.reverse[fileType],
        "files": List<dynamic>.from(files.map((x) => x)),
        "like_count": likeCount,
        "comment_count": commentCount,
        "share_count": shareCount,
        "share_id": shareId,
        "meta_data": metaData.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "feed_privacy": feedPrivacyValues.reverse[feedPrivacy],
        "is_background": isBackground,
        "bg_color": bgColor,
        "poll_id": pollId,
        "lesson_id": lessonId,
        "space_id": spaceId,
        "video_id": videoId,
        "stream_id": streamId,
        "blog_id": blogId,
        "schedule_date": scheduleDate,
        "timezone": timezone,
        "is_anonymous": isAnonymous,
        "meeting_id": meetingId,
        "seller_id": sellerId,
        "publish_date": publishDate.toIso8601String(),
        "is_feed_edit": isFeedEdit,
        "name": name,
        "pic": pic,
        "uid": uid,
        "is_private_chat": isPrivateChat,
        "user": user.toJson(),
        "group": group,
        "follow": follow,
        "likeType": List<dynamic>.from(likeType.map((x) => x.toJson())),
        "like": like.toJson(),
        "poll": poll,
        "savedPosts": savedPosts,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "meta": meta.toJson(),
      };
}

enum ActivityType { GROUP }

final activityTypeValues = EnumValues({"group": ActivityType.GROUP});

enum FeedPrivacy { PUBLIC }

final feedPrivacyValues = EnumValues({"Public": FeedPrivacy.PUBLIC});

enum FileType { TEXT }

final fileTypeValues = EnumValues({"text": FileType.TEXT});

class Like {
  final int id;
  final int feedId;
  final int userId;
  final String reactionType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int isAnonymous;
  final MetaDataClass meta;

  Like({
    required this.id,
    required this.feedId,
    required this.userId,
    required this.reactionType,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnonymous,
    required this.meta,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["id"],
        feedId: json["feed_id"],
        userId: json["user_id"],
        reactionType: json["reaction_type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isAnonymous: json["is_anonymous"],
        meta: MetaDataClass.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "feed_id": feedId,
        "user_id": userId,
        "reaction_type": reactionType,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_anonymous": isAnonymous,
        "meta": meta.toJson(),
      };
}

class MetaDataClass {
  MetaDataClass();

  factory MetaDataClass.fromJson(Map<String, dynamic> json) => MetaDataClass();

  Map<String, dynamic> toJson() => {};
}

class LikeType {
  final String reactionType;
  final int feedId;
  final MetaDataClass meta;

  LikeType({
    required this.reactionType,
    required this.feedId,
    required this.meta,
  });

  factory LikeType.fromJson(Map<String, dynamic> json) => LikeType(
        reactionType: json["reaction_type"],
        feedId: json["feed_id"],
        meta: MetaDataClass.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "reaction_type": reactionType,
        "feed_id": feedId,
        "meta": meta.toJson(),
      };
}

class PurpleMeta {
  final int views;

  PurpleMeta({
    required this.views,
  });

  factory PurpleMeta.fromJson(Map<String, dynamic> json) => PurpleMeta(
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "views": views,
      };
}

enum Status { APPROVED }

final statusValues = EnumValues({"APPROVED": Status.APPROVED});

class User {
  final int id;
  final String fullName;
  final String profilePic;
  final int isPrivateChat;
  final dynamic expireDate;
  final String status;
  final dynamic pauseDate;
  final UserType userType;
  final MetaDataClass meta;

  User({
    required this.id,
    required this.fullName,
    required this.profilePic,
    required this.isPrivateChat,
    required this.expireDate,
    required this.status,
    required this.pauseDate,
    required this.userType,
    required this.meta,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        profilePic: json["profile_pic"],
        isPrivateChat: json["is_private_chat"],
        expireDate: json["expire_date"],
        status: json["status"],
        pauseDate: json["pause_date"],
        userType: userTypeValues.map[json["user_type"]]!,
        meta: MetaDataClass.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_pic": profilePic,
        "is_private_chat": isPrivateChat,
        "expire_date": expireDate,
        "status": status,
        "pause_date": pauseDate,
        "user_type": userTypeValues.reverse[userType],
        "meta": meta.toJson(),
      };
}

enum UserType { SITE_OWNER, STUDENT }

final userTypeValues = EnumValues(
    {"SITE_OWNER": UserType.SITE_OWNER, "STUDENT": UserType.STUDENT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
