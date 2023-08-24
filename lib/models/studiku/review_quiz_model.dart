// To parse this JSON data, do
//
//     final quizReviewModel = quizReviewModelFromJson(jsonString);

import 'dart:convert';

QuizReviewModel quizReviewModelFromJson(String str) =>
    QuizReviewModel.fromJson(json.decode(str));

String quizReviewModelToJson(QuizReviewModel data) =>
    json.encode(data.toJson());

class QuizReviewModel {
  QuizReviewModel({
    required this.question,
    required this.userAnswer,
    required this.realAnswer,
    required this.isCorrect,
  });

  Question question;
  String userAnswer;
  String realAnswer;
  bool isCorrect;

  factory QuizReviewModel.fromJson(Map<String, dynamic> json) =>
      QuizReviewModel(
        question: Question.fromJson(json["question"]),
        userAnswer: json["user_answer"],
        realAnswer: json["real_answer"],
        isCorrect: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "question": question.toJson(),
        "user_answer": userAnswer,
        "real_answer": realAnswer,
        "is_correct": isCorrect,
      };
}

class Question {
  Question({
    required this.question,
    required this.choices,
  });

  String question;
  List<String> choices;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        choices: List<String>.from(json["choices"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "choices": List<dynamic>.from(choices.map((x) => x)),
      };
}
