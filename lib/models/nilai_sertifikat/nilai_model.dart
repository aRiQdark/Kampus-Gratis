class Nilai {
  Nilai({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  NilaiModel data;

  factory Nilai.fromJson(Map<String, dynamic> json) => Nilai(
        success: json["success"],
        message: json["message"],
        data: NilaiModel.fromJson(json["data"]),
      );
}

class NilaiModel {
  NilaiModel({
    this.studentInformation,
    this.subject,
  });

  StudentInformation? studentInformation;
  List<Subject>? subject;

  factory NilaiModel.fromJson(Map<String, dynamic> json) => NilaiModel(
        studentInformation: json["student_information"] == null
            ? null
            : StudentInformation.fromJson(json["student_information"]),
        subject: json["subject"] == null
            ? null
            : List<Subject>.from(
                json["subject"].map((x) => Subject.fromJson(x))),
      );
}

class StudentInformation {
  StudentInformation({
    this.studentName,
    this.nsn,
    this.major,
    this.semester,
    this.creditFinished,
    this.subjectsFinished,
    this.gpa,
  });

  String? studentName;
  String? nsn;
  String? major;
  int? semester;
  int? creditFinished;
  int? subjectsFinished;
  double? gpa;

  factory StudentInformation.fromJson(Map<String, dynamic> json) =>
      StudentInformation(
        studentName: json["student_name"],
        nsn: json["nsn"],
        major: json["major"],
        semester: json["semester"],
        creditFinished: json["credit_finished"],
        subjectsFinished: json["subjects_finished"],
        gpa: json["gpa"].toDouble(),
      );
}

class Subject {
  Subject({
    this.name,
    this.credit,
    this.score,
    this.predicate,
  });

  String? name;
  int? credit;
  double? score;
  String? predicate;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        name: json["name"],
        credit: json["credit"],
        score: json["score"].toDouble(),
        predicate: json["predicate"],
      );
}
