
class ResponseResultScoreboard {
    ResponseResultScoreboard({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    dynamic data;

    factory ResponseResultScoreboard.fromJson(Map<String, dynamic> json) => ResponseResultScoreboard(
        status: json["status"],
        message: json["message"],
        data: List<ScoreboardModel>.from(json["data"].map((x) => ScoreboardModel.fromJson(x))),
    );

    
}

class ScoreboardModel {
    ScoreboardModel({
        this.id,
        this.datumUserId,
        this.userRole,
        this.forumScore,
        this.gpa,
        this.finalScore,
        this.userId,
        this.user,
    });

    String? id;
    String? datumUserId;
    dynamic userRole;
    int? forumScore;
    double? gpa;
    int? finalScore;
    String? userId;
    User? user;

    factory ScoreboardModel.fromJson(Map<String, dynamic> json) => ScoreboardModel(
        id: json["id"],
        datumUserId: json["user_id"],
        userRole: json["user_role"],
        forumScore: json["forum_score"],
        gpa: json["gpa"].toDouble(),
        finalScore: json["final_score"],
        userId: json["UserId"],
        user: json["User"] == null ? null : User.fromJson(json["User"]),
    );

    
}

class User {
    User({
        this.fullName,
        this.displayPictureLink,
        this.id,
        this.username,
        this.student,
    });

    String? fullName;
    String? displayPictureLink;
    String? id;
    String? username;
    Student? student;

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        displayPictureLink: json["display_picture_link"],
        id: json["id"],
        username: json["username"],
        student: Student.fromJson(json["Student"]),
    );

    
}

class Student {
    Student({
        this.semester,
    });

    int? semester;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        semester: json["semester"],
    );

}
