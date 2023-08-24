// To parse this JSON data, do
//
//     final enrolledSubjectModel = enrolledSubjectModelFromJson(jsonString);

import 'dart:convert';

EnrolledSubjectModel enrolledSubjectModelFromJson(String str) =>
    EnrolledSubjectModel.fromJson(json.decode(str));

String enrolledSubjectModelToJson(EnrolledSubjectModel data) =>
    json.encode(data.toJson());

class EnrolledSubjectModel {
  EnrolledSubjectModel({
    required this.item,
    required this.progress,
    required this.studentCount,
    required this.lecturers,
  });

  Item item;
  int progress;
  int studentCount;
  List<String> lecturers;

  factory EnrolledSubjectModel.fromJson(Map<String, dynamic> json) =>
      EnrolledSubjectModel(
        item: Item.fromJson(json["item"]),
        progress: json["progress"],
        studentCount: json["student_count"],
        lecturers: List<String>.from(json["lecturers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "item": item.toJson(),
        "progress": progress,
        "student_count": studentCount,
        "lecturers": List<dynamic>.from(lecturers.map((x) => x)),
      };
}

class Item {
  Item({
    required this.id,
    required this.subjectId,
    required this.studentId,
    this.dateTaken,
    this.dateFinished,
    required this.status,
    this.finalScore,
    this.proof,
    this.proofLink,
    required this.subject,
  });

  String id;
  String subjectId;
  String studentId;
  dynamic dateTaken;
  dynamic dateFinished;
  String status;
  dynamic finalScore;
  dynamic proof;
  dynamic proofLink;
  Subject subject;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        subjectId: json["subject_id"],
        studentId: json["student_id"],
        dateTaken: json["date_taken"],
        dateFinished: json["date_finished"],
        status: json["status"],
        finalScore: json["final_score"],
        proof: json["proof"],
        proofLink: json["proof_link"],
        subject: Subject.fromJson(json["Subject"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "student_id": studentId,
        "date_taken": dateTaken,
        "date_finished": dateFinished,
        "status": status,
        "final_score": finalScore,
        "proof": proof,
        "proof_link": proofLink,
        "Subject": subject.toJson(),
      };
}

class Subject {
  Subject(
      {required this.id,
      required this.name,
      required this.numberOfSessions,
      required this.level,
      this.indicator,
      this.teachingMaterials,
      required this.credit,
      required this.lecturer,
      required this.thumbnailLink,
      required this.subjectCode});

  String id;
  String name;
  int numberOfSessions;
  String level;
  dynamic indicator;
  dynamic teachingMaterials;
  int credit;
  List<String> lecturer;
  String thumbnailLink;
  String subjectCode;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
        numberOfSessions: json["number_of_sessions"],
        level: json["level"],
        indicator: json["indicator"],
        teachingMaterials: json["teaching_materials"],
        credit: json["credit"],
        lecturer: List<String>.from(json["lecturer"].map((x) => x)),
        thumbnailLink: json["thumbnail_link"],
        subjectCode: json["subject_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number_of_sessions": numberOfSessions,
        "level": level,
        "indicator": indicator,
        "teaching_materials": teachingMaterials,
        "credit": credit,
        "lecturer": List<dynamic>.from(lecturer.map((x) => x)),
        "thumbnail_link": thumbnailLink,
      };
}
