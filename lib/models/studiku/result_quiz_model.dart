// To parse this JSON data, do
//
//     final resultQuizModel = resultQuizModelFromJson(jsonString);

import 'dart:convert';

ResultQuizModel resultQuizModelFromJson(String str) =>
    ResultQuizModel.fromJson(json.decode(str));

String resultQuizModelToJson(ResultQuizModel data) =>
    json.encode(data.toJson());

class ResultQuizModel {
  ResultQuizModel({
    required this.score,
    required this.status,
    required this.dateSubmitted,
    required this.numberOfQuestions,
    required this.correctAnswers,
    required this.durationTaken,
  });

  double score;
  String status;
  String dateSubmitted;
  int numberOfQuestions;
  int correctAnswers;
  int durationTaken;

  factory ResultQuizModel.fromJson(Map<String, dynamic> json) =>
      ResultQuizModel(
        score: json["score"].toDouble(),
        status: json["status"],
        dateSubmitted: json["date_submitted"],
        numberOfQuestions: json["number_of_questions"],
        correctAnswers: json["correct_answers"],
        durationTaken: json["duration_taken"],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "status": status,
        "date_submitted": dateSubmitted,
        "number_of_questions": numberOfQuestions,
        "correct_answers": correctAnswers,
        "duration_taken": durationTaken,
      };
}
