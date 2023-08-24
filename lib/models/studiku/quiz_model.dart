class QuizModel {
  QuizModel({
    required this.quiz,
    required this.materialEnrolledId,
    required this.startTime,
    required this.deadline,
  });

  List<Quiz> quiz;
  String materialEnrolledId;
  DateTime startTime;
  DateTime deadline;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        quiz: List<Quiz>.from(json["quiz"].map((x) => Quiz.fromJson(x))),
        materialEnrolledId: json["material_enrolled_id"],
        startTime: DateTime.parse(json["start_time"]),
        deadline: DateTime.parse(json["deadline"]),
      );

  Map<String, dynamic> toJson() => {
        "quiz": List<dynamic>.from(quiz.map((x) => x.toJson())),
        "material_enrolled_id": materialEnrolledId,
        "start_time": startTime.toIso8601String(),
        "deadline": deadline.toIso8601String(),
      };
}

class Quiz {
  Quiz({
    required this.question,
    required this.choices,
  });

  String question;
  List<String> choices;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        question: json["question"],
        choices: List<String>.from(json["choices"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "choices": List<dynamic>.from(choices.map((x) => x)),
      };
}
