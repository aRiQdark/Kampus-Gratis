class DraftKrs {
  DraftKrs({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  DraftKrsModel? data;

  factory DraftKrs.fromJson(Map<String, dynamic> json) => DraftKrs(
        status: json["status"],
        message: json["message"],
        data: DraftKrsModel.fromJson(json["data"]),
      );
}

class DraftKrsModel {
  DraftKrsModel({
    this.studentsInformation,
    this.subjectsEnrolled,
  });

  StudentsInformation? studentsInformation;
  SubjectsEnrolled? subjectsEnrolled;

  factory DraftKrsModel.fromJson(Map<String, dynamic> json) => DraftKrsModel(
        studentsInformation:
            StudentsInformation.fromJson(json["students_information"]),
        subjectsEnrolled: SubjectsEnrolled.fromJson(json["subjects_enrolled"]),
      );
}

class StudentsInformation {
  StudentsInformation({
    this.id,
    this.userId,
    this.supervisorId,
    this.semester,
    this.user,
    this.majors,
    this.lecturer,
  });

  String? id;
  String? userId;
  String? supervisorId;
  int? semester;
  User? user;
  List<Major>? majors;
  Lecturer? lecturer;

  factory StudentsInformation.fromJson(Map<String, dynamic> json) =>
      StudentsInformation(
        id: json["id"],
        userId: json["user_id"],
        supervisorId: json["supervisor_id"],
        semester: json["semester"],
        user: User.fromJson(json["User"]),
        majors: List<Major>.from(json["Majors"].map((x) => Major.fromJson(x))),
        lecturer: Lecturer.fromJson(json["Lecturer"]),
      );
}

class Lecturer {
  Lecturer({
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

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        id: json["id"],
        lecturerUserId: json["user_id"],
        isLecturer: json["is_lecturer"],
        isMentor: json["is_mentor"],
        approvedBy: json["approvedBy"],
        userId: json["UserId"],
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

class Major {
  Major({
    this.name,
    this.studentMajor,
  });

  String? name;
  StudentMajor? studentMajor;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        name: json["name"],
        studentMajor: StudentMajor.fromJson(json["StudentMajor"]),
      );
}

class StudentMajor {
  StudentMajor({
    this.id,
    this.studentMajorMajorId,
    this.studentMajorStudentId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.studentId,
    this.majorId,
  });

  String? id;
  String? studentMajorMajorId;
  String? studentMajorStudentId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic createdBy;
  dynamic updatedBy;
  String? studentId;
  String? majorId;

  factory StudentMajor.fromJson(Map<String, dynamic> json) => StudentMajor(
        id: json["id"],
        studentMajorMajorId: json["major_id"],
        studentMajorStudentId: json["student_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        studentId: json["StudentId"],
        majorId: json["MajorId"],
      );
}

class SubjectsEnrolled {
  SubjectsEnrolled({
    this.pending,
    this.ongoing,
    this.draft,
    this.totalCredit,
  });

  Draft? pending;
  Draft? ongoing;
  Draft? draft;
  int? totalCredit;

  factory SubjectsEnrolled.fromJson(Map<String, dynamic> json) =>
      SubjectsEnrolled(
        pending: Draft.fromJson(json["pending"]),
        ongoing: Draft.fromJson(json["ongoing"]),
        draft: Draft.fromJson(json["draft"]),
        totalCredit: json["total_credit"],
      );
}

class Draft {
  Draft({
    this.subjects,
    this.credit,
  });

  List<Subject>? subjects;
  int? credit;

  factory Draft.fromJson(Map<String, dynamic> json) => Draft(
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
        credit: json["credit"],
      );
}

class Subject {
  Subject({
    this.name,
    this.credit,
    this.subjectId,
  });

  String? name;
  int? credit;
  String? subjectId;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        name: json["name"],
        credit: json["credit"],
        subjectId: json["subject_id"],
      );
}
