class ResponseResultDiscussion {
  ResponseResultDiscussion({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory ResponseResultDiscussion.fromJson(Map<String, dynamic> json) =>
      ResponseResultDiscussion(
        status: json["status"],
        message: json["message"],
        data: List<DiscussionModel>.from(
            json["data"].map((x) => DiscussionModel.fromJson(x))),
      );
}

class DiscussionModel {
  DiscussionModel({
    this.id,
    this.authorId,
    this.sessionId,
    this.title,
    this.content,
    this.teacherLike,
    this.studentLike,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  String? id;
  String? authorId;
  String? sessionId;
  String? title;
  String? content;
  List<dynamic>? teacherLike;
  List<dynamic>? studentLike;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory DiscussionModel.fromJson(Map<String, dynamic> json) =>
      DiscussionModel(
        id: json["id"],
        authorId: json["author_id"],
        sessionId: json["session_id"],
        title: json["title"],
        content: json["content"],
        teacherLike: List<dynamic>.from(json["teacher_like"].map((x) => x)),
        studentLike: List<dynamic>.from(json["student_like"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["User"]),
      );
}

class User {
  User({
    this.fullName,
    this.displayPictureLink,
  });

  String? fullName;
  String? displayPictureLink;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        displayPictureLink: json["display_picture_link"],
      );
}
