// To parse this JSON data, do
//
//     final sessionModel = sessionModelFromJson(jsonString);

import 'dart:convert';

SessionModel sessionModelFromJson(String str) =>
    SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  SessionModel({
    required this.id,
    required this.subjectId,
    required this.sessionNo,
    required this.duration,
    required this.isSync,
    required this.type,
    required this.description,
    required this.isLocked,
    required this.assignmentDone,
    required this.quizDone,
    required this.sessionLock,
  });

  String id;
  String subjectId;
  int sessionNo;
  int duration;
  bool isSync;
  String type;
  String description;
  bool isLocked;
  bool assignmentDone;
  bool quizDone;
  bool sessionLock;

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        id: json["id"],
        subjectId: json["subject_id"],
        sessionNo: json["session_no"],
        duration: json["duration"],
        isSync: json["is_sync"],
        type: json["type"],
        description: json["description"],
        isLocked: json["is_locked"],
        assignmentDone: json["assignment_done"],
        quizDone: json["quiz_done"],
        sessionLock: json["session_lock"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "session_no": sessionNo,
        "duration": duration,
        "is_sync": isSync,
        "type": type,
        "description": description,
        "is_locked": isLocked,
        "assignment_done": assignmentDone,
        "quiz_done": quizDone,
        "session_lock": sessionLock,
      };
}
