// To parse this JSON data, do
//
//     final descriptionQuizModel = descriptionQuizModelFromJson(jsonString);

import 'dart:convert';

DescriptionQuizModel descriptionQuizModelFromJson(String str) =>
    DescriptionQuizModel.fromJson(json.decode(str));

String descriptionQuizModelToJson(DescriptionQuizModel data) =>
    json.encode(data.toJson());

class DescriptionQuizModel {
  DescriptionQuizModel({
    required this.quiz,
    this.summary,
  });

  Quiz quiz;
  List<Summary>? summary;

  factory DescriptionQuizModel.fromJson(Map<String, dynamic> json) =>
      DescriptionQuizModel(
        quiz: Quiz.fromJson(json["quiz"]),
        summary:
            List<Summary>.from(json["summary"].map((x) => Summary.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quiz": quiz.toJson(),
        "summary": List<dynamic>.from(summary!.map((x) => x.toJson())),
      };
}

class Quiz {
  Quiz({
    required this.id,
    required this.description,
  });

  String id;
  String description;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
      };
}

class Summary {
  Summary({
    required this.id,
    required this.activityDetail,
    required this.score,
    required this.subjectId,
    required this.sessionId,
    required this.status,
  });

  String id;
  ActivityDetail activityDetail;
  double score;
  String subjectId;
  String sessionId;
  String status;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        id: json["id"],
        activityDetail: ActivityDetail.fromJson(json["activity_detail"]),
        score: json["score"].toDouble(),
        subjectId: json["subject_id"],
        sessionId: json["session_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity_detail": activityDetail.toJson(),
        "score": score,
        "subject_id": subjectId,
        "session_id": sessionId,
        "status": status,
      };
}

class ActivityDetail {
  ActivityDetail({
    required this.dateSubmit,
    required this.numberOfQuestions,
    required this.correctAnswers,
    required this.durationTaken,
    required this.answer,
  });

  String dateSubmit;
  int numberOfQuestions;
  int correctAnswers;
  int durationTaken;
  List<String> answer;

  factory ActivityDetail.fromJson(Map<String, dynamic> json) => ActivityDetail(
        dateSubmit: json["date_submit"],
        numberOfQuestions: json["number_of_questions"],
        correctAnswers: json["correct_answers"],
        durationTaken: json["duration_taken"],
        answer: List<String>.from(json["answer"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date_submit": dateSubmit,
        "number_of_questions": numberOfQuestions,
        "correct_answers": correctAnswers,
        "duration_taken": durationTaken,
        "answer": List<dynamic>.from(answer.map((x) => x)),
      };
}
