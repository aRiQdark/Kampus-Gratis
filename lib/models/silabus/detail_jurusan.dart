class DetailJurusan {
  DetailJurusan({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  DetailJurusanModel? data;

  factory DetailJurusan.fromJson(Map<String, dynamic> json) => DetailJurusan(
        status: json["status"],
        message: json["message"],
        data: DetailJurusanModel.fromJson(json["data"]),
      );
}

class DetailJurusanModel {
  DetailJurusanModel({
    this.studentsInformation,
    this.major,
    this.result,
  });

  StudentsInformation? studentsInformation;
  Major? major;
  List<Result>? result;

  factory DetailJurusanModel.fromJson(Map<String, dynamic> json) =>
      DetailJurusanModel(
        studentsInformation:
            StudentsInformation.fromJson(json["students_information"]),
        major: Major.fromJson(json["major"]),
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}

class Major {
  Major({
    this.id,
    this.name,
    this.description,
    this.updatedAt,
    this.thumbnailLink,
    this.lecturer,
  });

  String? id;
  String? name;
  String? description;
  DateTime? updatedAt;
  String? thumbnailLink;
  MajorLecturer? lecturer;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
        thumbnailLink: json["thumbnail_link"],
        lecturer: MajorLecturer.fromJson(json["Lecturer"]),
      );
}

class MajorLecturer {
  MajorLecturer({
    this.id,
    this.user,
  });

  String? id;
  User? user;

  factory MajorLecturer.fromJson(Map<String, dynamic> json) => MajorLecturer(
        id: json["id"],
        user: User.fromJson(json["User"]),
      );
}

class User {
  User({
    this.fullName,
  });

  String? fullName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
      );
}

class Result {
  Result({
    this.semester,
    this.subjects,
  });

  int? semester;
  List<SubjectElement>? subjects;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        semester: json["semester"],
        subjects: List<SubjectElement>.from(
            json["subjects"].map((x) => SubjectElement.fromJson(x))),
      );
}

class SubjectElement {
  SubjectElement({
    this.subject,
    this.lecturers,
    this.studentCount,
  });

  SubjectSubject? subject;
  List<Lecturer>? lecturers;
  int? studentCount;

  factory SubjectElement.fromJson(Map<String, dynamic> json) => SubjectElement(
        subject: SubjectSubject.fromJson(json["subject"]),
        lecturers: List<Lecturer>.from(
            json["lecturers"].map((x) => Lecturer.fromJson(x))),
        studentCount: json["student_count"],
      );
}

class Lecturer {
  Lecturer({
    this.user,
  });

  User? user;

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        user: User.fromJson(json["User"]),
      );
}

class SubjectSubject {
  SubjectSubject({
    this.name,
    this.id,
    this.credit,
    this.level,
    this.thumbnailLink,
    this.lecturer,
    this.subjectCode,
  });

  String? name;
  String? id;
  int? credit;
  String? level;
  String? thumbnailLink;
  List<String>? lecturer;
  String? subjectCode;

  factory SubjectSubject.fromJson(Map<String, dynamic> json) => SubjectSubject(
        name: json["name"],
        id: json["id"],
        credit: json["credit"],
        level: json["level"],
        thumbnailLink: json["thumbnail_link"],
        lecturer: List<String>.from(json["lecturer"].map((x) => x)),
        subjectCode: json["subject_code"],
      );
}

class StudentsInformation {
  StudentsInformation({
    this.semester,
    this.user,
    this.majors,
    this.lecturer,
  });

  int? semester;
  User? user;
  List<dynamic>? majors;
  StudentsInformationLecturer? lecturer;

  factory StudentsInformation.fromJson(Map<String, dynamic> json) =>
      StudentsInformation(
        semester: json["semester"],
        user: User.fromJson(json["User"]),
        majors: List<dynamic>.from(json["Majors"].map((x) => x)),
        lecturer: StudentsInformationLecturer.fromJson(json["Lecturer"]),
      );
}

class StudentsInformationLecturer {
  StudentsInformationLecturer({
    this.id,
    this.lecturerUserId,
    this.isLecturer,
    this.isMentor,
    this.approvedBy,
    this.userId,
    this.user,
  });

  String? id;
  String? lecturerUserId;
  bool? isLecturer;
  bool? isMentor;
  dynamic approvedBy;
  String? userId;
  User? user;

  factory StudentsInformationLecturer.fromJson(Map<String, dynamic> json) =>
      StudentsInformationLecturer(
        id: json["id"],
        lecturerUserId: json["user_id"],
        isLecturer: json["is_lecturer"],
        isMentor: json["is_mentor"],
        approvedBy: json["approvedBy"],
        userId: json["UserId"],
        user: User.fromJson(json["User"]),
      );
}
