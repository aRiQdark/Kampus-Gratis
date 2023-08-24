class PerencanaanKarir {
  PerencanaanKarir({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final PerencanaanKarirModel? data;

  factory PerencanaanKarir.fromJson(Map<String, dynamic> json) =>
      PerencanaanKarir(
        status: json["status"],
        message: json["message"],
        data: PerencanaanKarirModel.fromJson(json["data"]),
      );
}

class PerencanaanKarirModel {
  PerencanaanKarirModel({
    required this.career,
    required this.subjectsTaken,
    required this.remainingSubjects,
    required this.accuracy,
  });

  final String career;
  final List subjectsTaken;
  final List remainingSubjects;
  final double accuracy;

  factory PerencanaanKarirModel.fromJson(Map<String, dynamic> json) =>
      PerencanaanKarirModel(
        career: json["career"],
        subjectsTaken: json["subjects_taken"],
        remainingSubjects: json["remaining_subjects"],
        accuracy: json["accuracy"],
      );
}
