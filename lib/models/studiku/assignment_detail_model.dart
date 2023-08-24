class AssignmentDetail {
  AssignmentDetail({
     this.status,
     this.message,
     this.data,
  });

  final bool? status;
  final String? message;
  final AssignmentDetailModel? data;

  factory AssignmentDetail.fromJson(Map<String?, dynamic> json) => AssignmentDetail(
        status: json["status"],
        message: json["message"],
        data: AssignmentDetailModel.fromJson(json["data"]),
      );

  // Map<String?, dynamic> toJson() => {
  //       "status": status,
  //       "message": message,
  //       "data": data.toJson(),
  //     };
}

class AssignmentDetailModel {
  AssignmentDetailModel({
     this.assignment,
     this.studentsWork,
  });

  final AssignmentClass? assignment;
  final StudentsWork? studentsWork;

  factory AssignmentDetailModel.fromJson(Map<String?, dynamic>? json) =>
      AssignmentDetailModel(
        assignment: AssignmentClass.fromJson(json?["assignment"]),
        studentsWork: StudentsWork.fromJson(json?["students_work"]),
      );

  // Map<String?, dynamic> toJson() => {
  //       "assignment": assignment.toJson(),
  //       "students_work": studentsWork.toJson(),
  //     };
}

class AssignmentClass {
  AssignmentClass(
      { this.id,
       this.content,
       this.description,
       this.fileAssignment,
       this.fileAssignmentLink,
       this.duration,
      //  this.createdAt,
       this.deadline});

  final String? id;
  final String? content;
  final String? description;
  final String? fileAssignment;
  final String? fileAssignmentLink;
  final int? duration;
  // final String? createdAt;
  final String? deadline;

  factory AssignmentClass.fromJson(Map<String?, dynamic> json) =>
      AssignmentClass(
        id: json["id"],
        content: json["content"],
        description: json["description"],
        fileAssignment: json["file_assignment"],
        fileAssignmentLink: json["file_assignment_link"],
        duration: json["duration"],
        // createdAt: json["created_at"],
        deadline: json["deadline"],
      );

  // Map<String?, dynamic> toJson() => {
  //       "id": id,
  //       "content": content,
  //       "description": description,
  //       "file_assignment": fileAssignment,
  //       "file_assignment_link": fileAssignmentLink,
  //       "duration": duration,
  //       "deadline": deadline,
  //     };
}

class StudentsWork {
  StudentsWork({
     this.id,
     this.studentId,
     this.sessionId,
     this.materialId,
     this.subjectId,
     this.description,
     this.status,
     this.idReferrer,
     this.type,
     this.score,
    this.activityDetail,
  });

  final String? id;
  final String? studentId;
  final String? sessionId;
  final dynamic materialId;
  final dynamic subjectId;
  final String? description;
  final String? status;
  final String? idReferrer;
  final String? type;
  final dynamic score;
  final ActivityDetail? activityDetail;

  factory StudentsWork.fromJson(Map<String?, dynamic> json) => StudentsWork(
        id: json["id"],
        studentId: json["student_id"],
        sessionId: json["session_id"],
        materialId: json["material_id"],
        subjectId: json["subject_id"],
        description: json["description"],
        status: json["status"],
        idReferrer: json["id_referrer"],
        type: json["type"],
        score: json["score"],
        activityDetail: ActivityDetail?.fromJson(json["activity_detail"]),
      );

  // Map<String?, dynamic> toJson() => {
  //       "id": id,
  //       "student_id": studentId,
  //       "session_id": sessionId,
  //       "material_id": materialId,
  //       "subject_id": subjectId,
  //       "description": description,
  //       "status": status,
  //       "id_referrer": idReferrer,
  //       "type": type,
  //       "score": score,
  //       "activity_detail": activityDetail?.toJson(),
  //     };
}

class ActivityDetail {
  ActivityDetail({
    this.dateSubmit,
    this.fileAssignment,
    this.fileAssignmentLink,
  });

  final String? dateSubmit;
  final String? fileAssignment;
  final String? fileAssignmentLink;

  factory ActivityDetail.fromJson(Map<String?, dynamic>? json) => ActivityDetail(
        dateSubmit: json?["date_submit"],
        fileAssignment: json?["file_assignment"],
        fileAssignmentLink: json?["file_assignment_link"],
      );

  // Map<String?, dynamic> toJson() => {
  //       "date_submit": dateSubmit,
  //       "file_assignment": fileAssignment,
  //       "file_assignment_link": fileAssignmentLink,
  //     };
}
