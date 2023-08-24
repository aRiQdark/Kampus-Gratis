class Assignment {
  Assignment({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final AssignmentModel data;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        status: json["status"],
        message: json["message"],
        data: AssignmentModel.fromJson(json["data"]),
      );
}

class AssignmentModel {
  AssignmentModel({
    required this.ongoing,
    required this.grading,
    required this.finished,
    required this.late,
  });

  final List<Ongoing> ongoing;
  final List<Grading> grading;
  final List<Finished> finished;
  final List<Late> late;

  factory AssignmentModel.fromJson(Map<String, dynamic> json) =>
      AssignmentModel(
        ongoing:
            List<Ongoing>.from(json["ongoing"].map((x) => Ongoing.fromJson(x))),
        grading:
            List<Grading>.from(json["grading"].map((x) => Grading.fromJson(x))),
        finished: List<Finished>.from(
            json["finished"].map((x) => Finished.fromJson(x))),
        late: List<Late>.from(json["late"].map((x) => Late.fromJson(x))),
      );
}

class Ongoing {
  Ongoing(
      {required this.id,
      required this.studentId,
      required this.sessionId,
      required this.materialId,
      required this.subjectId,
      required this.description,
      required this.status,
      required this.idReferrer,
      required this.score,
      required this.session,
      required this.subject,
      required this.deadline,
      required this.penugasan});

  final String id;
  final String studentId;
  final String sessionId;
  final dynamic materialId;
  final String subjectId;
  final String description;
  final String status;
  final String idReferrer;
  final dynamic score;
  final Session session;
  final Subject subject;
  final String deadline;
  final Penugasan penugasan;

  factory Ongoing.fromJson(Map<String, dynamic> json) => Ongoing(
        id: json["id"],
        studentId: json["student_id"],
        sessionId: json["session_id"],
        materialId: json["material_id"],
        subjectId: json["subject_id"],
        description: json["description"],
        status: json["status"],
        idReferrer: json["id_referrer"],
        score: json["score"],
        session: Session.fromJson(json["Session"]),
        subject: Subject.fromJson(json["Subject"]),
        deadline: json["deadline"],
        penugasan: Penugasan.fromJson(json["Assignment"]),
      );
}

class Grading {
  Grading({
    required this.id,
    required this.studentId,
    required this.sessionId,
    required this.materialId,
    required this.subjectId,
    required this.description,
    required this.status,
    required this.idReferrer,
    required this.score,
    required this.session,
    required this.subject,
    required this.deadline,
    required this.activityDetail,
    required this.penugasan,
  });

  final String id;
  final String studentId;
  final String sessionId;
  final dynamic materialId;
  final String subjectId;
  final String description;
  final String status;
  final String idReferrer;
  final dynamic score;
  final Session session;
  final Subject subject;
  final String deadline;
  final ActivityDetail activityDetail;
  final Penugasan penugasan;

  factory Grading.fromJson(Map<String, dynamic> json) => Grading(
        id: json["id"],
        studentId: json["student_id"],
        sessionId: json["session_id"],
        materialId: json["material_id"],
        subjectId: json["subject_id"],
        description: json["description"],
        status: json["status"],
        idReferrer: json["id_referrer"],
        score: json["score"],
        session: Session.fromJson(json["Session"]),
        subject: Subject.fromJson(json["Subject"]),
        deadline: json["deadline"],
        activityDetail: ActivityDetail.fromJson(json["activity_detail"]),
        penugasan: Penugasan.fromJson(json["Assignment"]),
      );
}

class Finished {
  Finished({
    required this.id,
    required this.studentId,
    required this.sessionId,
    required this.materialId,
    required this.subjectId,
    required this.description,
    required this.status,
    required this.idReferrer,
    required this.score,
    required this.session,
    required this.subject,
    required this.deadline,
    required this.activityDetail,
    required this.penugasan,
  });

  final String id;
  final String studentId;
  final String sessionId;
  final dynamic materialId;
  final String subjectId;
  final String description;
  final String status;
  final String idReferrer;
  final dynamic score;
  final Session session;
  final Subject subject;
  final String deadline;
  final ActivityDetail activityDetail;
  final Penugasan penugasan;

  factory Finished.fromJson(Map<String, dynamic> json) => Finished(
        id: json["id"],
        studentId: json["student_id"],
        sessionId: json["session_id"],
        materialId: json["material_id"],
        subjectId: json["subject_id"],
        description: json["description"],
        status: json["status"],
        idReferrer: json["id_referrer"],
        score: json["score"],
        session: Session.fromJson(json["Session"]),
        subject: Subject.fromJson(json["Subject"]),
        deadline: json["deadline"],
        activityDetail: ActivityDetail.fromJson(json["activity_detail"]),
        penugasan: Penugasan.fromJson(json["Assignment"]),
      );
}

class Late {
  Late({
    required this.id,
    required this.studentId,
    required this.sessionId,
    required this.materialId,
    required this.subjectId,
    required this.description,
    required this.status,
    required this.idReferrer,
    required this.score,
    required this.session,
    required this.subject,
    required this.deadline,
    required this.penugasan,
  });

  final String id;
  final String studentId;
  final String sessionId;
  final dynamic materialId;
  final String subjectId;
  final String description;
  final String status;
  final String idReferrer;
  final dynamic score;
  final Session session;
  final Subject subject;
  final String deadline;
  final Penugasan penugasan;

  factory Late.fromJson(Map<String, dynamic> json) => Late(
        id: json["id"],
        studentId: json["student_id"],
        sessionId: json["session_id"],
        materialId: json["material_id"],
        subjectId: json["subject_id"],
        description: json["description"],
        status: json["status"],
        idReferrer: json["id_referrer"],
        score: json["score"],
        session: Session.fromJson(json["Session"]),
        subject: Subject.fromJson(json["Subject"]),
        deadline: json["deadline"],
        penugasan: Penugasan.fromJson(json["Assignment"]),
      );
}

class ActivityDetail {
  ActivityDetail({
    required this.dateSubmit,
  });
  final String dateSubmit;
  factory ActivityDetail.fromJson(Map<String, dynamic> json) => ActivityDetail(
        dateSubmit: json["date_submit"],
      );
}

class Penugasan {
  Penugasan({
    required this.lecturer,
  });
  final Lecturer lecturer;
  factory Penugasan.fromJson(Map<String, dynamic> json) => Penugasan(
        lecturer: Lecturer.fromJson(json["Lecturer"]),
      );
}

class Lecturer {
  Lecturer({
    required this.title,
    required this.user,
  });

  final List<dynamic> title;
  final User user;
  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        title: json["title"],
        user: User.fromJson(json["User"]),
      );
}


class User {
  User({
    required this.fullName,
  });
  final String fullName;
  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
      );
}

class Session {
  Session({
    required this.sessionNo,
  });
  final int sessionNo;
  factory Session.fromJson(Map<String, dynamic> json) => Session(
        sessionNo: json["session_no"],
      );
}

class Subject {
  Subject({
    required this.name,
  });

  final String name;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        name: json["name"],
      );
}
