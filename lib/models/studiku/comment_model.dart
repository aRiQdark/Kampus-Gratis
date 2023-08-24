class ResponseResultComment {
  ResponseResultComment({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  dynamic data;

  factory ResponseResultComment.fromJson(Map<String, dynamic> json) =>
      ResponseResultComment(
        status: json["status"],
        message: json["message"],
        data: List<CommentModel>.from(
            json["data"].map((x) => CommentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CommentModel {
  CommentModel({
    required this.id,
    required this.dfId,
    required this.authorId,
    required this.content,
    required this.teacherLike,
    required this.studentLike,
  });

  String id;
  String dfId;
  String authorId;
  String content;
  List<dynamic> teacherLike;
  List<dynamic> studentLike;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        dfId: json["df_id"],
        authorId: json["author_id"],
        content: json["content"],
        teacherLike: List<dynamic>.from(json["teacher_like"].map((x) => x)),
        studentLike: List<dynamic>.from(json["student_like"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "df_id": dfId,
        "author_id": authorId,
        "content": content,
        "teacher_like": List<dynamic>.from(teacherLike.map((x) => x)),
        "student_like": List<dynamic>.from(studentLike.map((x) => x)),
      };
}
