class ResponseResultDiscussionGlobal {
  ResponseResultDiscussionGlobal({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory ResponseResultDiscussionGlobal.fromJson(Map<String, dynamic> json) =>
      ResponseResultDiscussionGlobal(
        status: json["status"],
        message: json["message"],
        data: List<DiscussionGlobalModel>.from(
            json["data"].map((x) => DiscussionGlobalModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DiscussionGlobalModel {
  DiscussionGlobalModel({
    this.id,
    this.authorId,
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
  String? title;
  String? content;
  List<dynamic>? teacherLike;
  List<dynamic>? studentLike;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory DiscussionGlobalModel.fromJson(Map<String, dynamic> json) =>
      DiscussionGlobalModel(
        id: json["id"],
        authorId: json["author_id"],
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
