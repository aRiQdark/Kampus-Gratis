
class Sertifikat {
  Sertifikat({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<SertifikatModel>? data;

  factory Sertifikat.fromJson(Map<String, dynamic> json) => Sertifikat(
        status: json["status"],
        message: json["message"],
        data: List<SertifikatModel>.from(
            json["data"].map((x) => SertifikatModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SertifikatModel {
  SertifikatModel({
    this.idCertificate,
    this.subjectId,
    this.link,
    this.thumbnailLink,
    this.subject,
  });

  String? idCertificate;
  String? subjectId;
  String? link;
  dynamic thumbnailLink;
  Subject? subject;

  factory SertifikatModel.fromJson(Map<String, dynamic> json) =>
      SertifikatModel(
        idCertificate: json["id_certificate"],
        subjectId: json["subject_id"],
        link: json["link"],
        thumbnailLink: json["thumbnail_link"],
        subject: Subject.fromJson(json["subject"]),
      );

  Map<String, dynamic> toJson() => {
        "id_certificate": idCertificate,
        "subject_id": subjectId,
        "link": link,
        "thumbnail_link": thumbnailLink,
        "subject": subject!.toJson(),
      };
}

class Subject {
  Subject({
    this.name,
  });

  String? name;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
