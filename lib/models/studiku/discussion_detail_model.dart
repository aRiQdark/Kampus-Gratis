// class ResponseResultDetailDiscussion {
//   ResponseResultDetailDiscussion({
//     this.status,
//     this.message,
//     this.data,
//   });

//   bool? status;
//   String? message;
//   dynamic data;

//   factory ResponseResultDetailDiscussion.fromJson(Map<String, dynamic> json) =>
//       ResponseResultDetailDiscussion(
//         status: json["status"],
//         message: json["message"],
//         data: DetailDiscussionModel.fromJson(json["data"]),
//       );
// }

// class DetailDiscussionModel {
//   DetailDiscussionModel({
//     this.id,
//     this.authorId,
//     this.sessionId,
//     this.title,
//     this.content,
//     this.teacherLike,
//     this.studentLike,
//     this.createdAt,
//     this.updatedAt,
//     this.user,
//     this.comments,
//   });

//   String? id;
//   String? authorId;
//   String? sessionId;
//   String? title;
//   String? content;
//   List<dynamic>? teacherLike;
//   List<String>? studentLike;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   User? user;
//   List<Comment>? comments;

//   factory DetailDiscussionModel.fromJson(Map<String, dynamic> json) =>
//       DetailDiscussionModel(
//         id: json["id"],
//         authorId: json["author_id"],
//         sessionId: json["session_id"],
//         title: json["title"],
//         content: json["content"],
//         teacherLike: List<dynamic>.from(json["teacher_like"].map((x) => x)),
//         studentLike: List<String>.from(json["student_like"].map((x) => x)),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         user: User.fromJson(json["User"]),
//         comments: List<Comment>.from(
//             json["Comments"].map((x) => Comment.fromJson(x))),
//       );
// }

// class Comment {
//   Comment({
//     this.id,
//     this.dfId,
//     this.authorId,
//     this.content,
//     this.teacherLike,
//     this.studentLike,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.createdBy,
//     this.updatedBy,
//     this.user,
//     this.replies,
//     this.commentId,
//   });

//   String? id;
//   String? dfId;
//   String? authorId;
//   String? content;
//   List<dynamic>? teacherLike;
//   List<String>? studentLike;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic deletedAt;
//   dynamic createdBy;
//   dynamic updatedBy;
//   User? user;
//   List<Comment>? replies;
//   String? commentId;

//   factory Comment.fromJson(Map<String, dynamic> json) => Comment(
//         id: json["id"],
//         dfId: json["df_id"],
//         authorId: json["author_id"],
//         content: json["content"],
//         teacherLike: List<dynamic>.from(json["teacher_like"].map((x) => x)),
//         studentLike: List<String>.from(json["student_like"].map((x) => x)),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         user: User.fromJson(json["User"]),
// replies: json["Replies"] == null
//     ? null
//     : List<Comment>.from(
//         json["Replies"].map((x) => Comment.fromJson(x))),
//         commentId: json["comment_id"],
//       );
// }

// class User {
//   User({
//     this.fullName,
//     this.displayPictureLink,
//   });

//   String? fullName;
//   String? displayPictureLink;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         fullName: json["full_name"],
//         displayPictureLink: json["display_picture_link"],
//       );
// }

class ResponseResultDetailDiscussion {
  ResponseResultDetailDiscussion({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  dynamic data;

  factory ResponseResultDetailDiscussion.fromJson(Map<String, dynamic> json) =>
      ResponseResultDetailDiscussion(
        status: json["status"],
        message: json["message"],
        data: DetailDiscussionModel.fromJson(json["data"]),
      );
}

class DetailDiscussionModel {
  DetailDiscussionModel({
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
    this.comments,
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
  List<Comment>? comments;

  factory DetailDiscussionModel.fromJson(Map<String, dynamic> json) =>
      DetailDiscussionModel(
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
        comments: List<Comment>.from(
            json["Comments"].map((x) => Comment.fromJson(x))),
      );
}

class Comment {
  Comment({
    this.id,
    this.dfId,
    this.authorId,
    this.content,
    this.teacherLike,
    this.studentLike,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.user,
    this.replies,
  });

  String? id;
  String? dfId;
  String? authorId;
  String? content;
  List<dynamic>? teacherLike;
  List<String>? studentLike;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic createdBy;
  dynamic updatedBy;
  User? user;
  List<dynamic>? replies;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        dfId: json["df_id"],
        authorId: json["author_id"],
        content: json["content"],
        teacherLike: List<dynamic>.from(json["teacher_like"].map((x) => x)),
        studentLike: List<String>.from(json["student_like"].map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        user: User.fromJson(json["User"]),
        replies: json["Replies"] == null
            ? null
            : List<Comment>.from(
                json["Replies"].map((x) => Comment.fromJson(x))),
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
